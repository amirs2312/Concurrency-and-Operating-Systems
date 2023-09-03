import socket
import threading
import os

IP = socket.gethostbyname(socket.gethostname())
PORT_SPEAK = 3345
ADDR_SPEAK = (IP, PORT_SPEAK)
PORT_LISTEN = 3344
ADDR_LISTEN = (IP, PORT_LISTEN)
SIZE = 2048
FORMAT = "utf-8"
DISCONNECT_MSG = "!DISCONNECT"
FILE_MSG = "!FILE"

key = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
nonce = [0, 1, 2, 3, 4, 5, 6, 7]
block_counter = [0, 0, 0, 0, 0, 0, 0, 0]



# Testing the beginning of the Salsa

########################################################################
class Salsa:
  def __init__(self,r=20):
    assert r >= 0
    self._r = r # number of rounds
    self._mask = 0xffffffff # 32-bit mask
  
  def __call__(self,key=[0]*32,nonce=[0]*8,block_counter=[0]*8):
    assert len(key) == 32
    assert len(nonce) == 8
    assert len(block_counter) == 8
     
    # init state
    k = [self._littleendian(key[4*i:4*i+4]) for i in xrange(8)]
    n = [self._littleendian(nonce[4*i:4*i+4]) for i in xrange(2)]
    b = [self._littleendian(block_counter[4*i:4*i+4]) for i in xrange(2)]
    c = [0x61707865, 0x3320646e, 0x79622d32, 0x6b206574]

    s = [c[0], k[0], k[1], k[2], 
         k[3], c[1], n[0], n[1],
         b[0], b[1], c[2], k[4], 
         k[5], k[6], k[7], c[3]]

    # the state
    self._s = s[:]

    for i in range(self._r):
      self._round()

    # add initial state to the final one
    self._s = [(self._s[i] + s[i]) & self._mask for i in xrange(16)]

    return self._s

  def _littleendian(self,b):
    assert len(b) == 4
    return b[0] ^ (b[1] << 8) ^ (b[2] << 16) ^ (b[3] << 24)

  def _round(self):

    # quarterround 1
    self._s[ 4] ^= self._rotl32((self._s[ 0] + self._s[12]) & self._mask, 7)
    self._s[ 8] ^= self._rotl32((self._s[ 0] + self._s[ 4]) & self._mask, 9)
    self._s[12] ^= self._rotl32((self._s[ 4] + self._s[ 8]) & self._mask,13)
    self._s[ 0] ^= self._rotl32((self._s[ 8] + self._s[12]) & self._mask,18)

    # quarterround 2
    self._s[ 9] ^= self._rotl32((self._s[ 1] + self._s[ 5]) & self._mask, 7)
    self._s[13] ^= self._rotl32((self._s[ 5] + self._s[ 9]) & self._mask, 9)
    self._s[ 1] ^= self._rotl32((self._s[ 9] + self._s[13]) & self._mask,13)
    self._s[ 5] ^= self._rotl32((self._s[ 1] + self._s[13]) & self._mask,18)

    # quarterround 3
    self._s[14] ^= self._rotl32((self._s[ 6] + self._s[10]) & self._mask, 7)
    self._s[ 2] ^= self._rotl32((self._s[10] + self._s[14]) & self._mask, 9)
    self._s[ 6] ^= self._rotl32((self._s[ 2] + self._s[14]) & self._mask,13)
    self._s[10] ^= self._rotl32((self._s[ 2] + self._s[ 6]) & self._mask,18)

    # quarterround 4
    self._s[ 3] ^= self._rotl32((self._s[11] + self._s[15]) & self._mask, 7)
    self._s[ 7] ^= self._rotl32((self._s[ 3] + self._s[15]) & self._mask, 9)
    self._s[11] ^= self._rotl32((self._s[ 3] + self._s[ 7]) & self._mask,13)
    self._s[15] ^= self._rotl32((self._s[ 7] + self._s[11]) & self._mask,18)

    # transpose
    self._s = [self._s[ 0], self._s[ 4], self._s[ 8], self._s[12],
               self._s[ 1], self._s[ 5], self._s[ 9], self._s[13],
               self._s[ 2], self._s[ 6], self._s[10], self._s[14],
               self._s[ 3], self._s[ 7], self._s[11], self._s[15]]

  def _rotl32(self,w,r):
    # rotate left for 32-bits
    return ( ( ( w << r ) & self._mask) | ( w >> ( 32 - r ) ) ) 


def encrypt_data(data, key, nonce, block_counter):
    salsa = Salsa()
    encrypted_data = bytearray()
    for i in range(0, len(data), 64):
        block = data[i:i + 64]
        key_stream = salsa(key, nonce, block_counter)
        block_counter = increment_counter(block_counter)
        encrypted_block = bytearray([block[i] ^ key_stream[i % 16] for i in range(len(block))])
        encrypted_data.extend(encrypted_block)
    return encrypted_data

def decrypt_data(data, key, nonce, block_counter):
    return encrypt_data(data, key, nonce, block_counter)

def increment_counter(counter):
    new_counter = counter[:]
    for i in reversed(range(len(new_counter))):
        if new_counter[i] < 255:
            new_counter[i] += 1
            break
        new_counter[i] = 0
    return new_counter



########################################################################

# Define function for sending message containing file
def c_file_transfer(client):

    # Receive confirmation from server that file transfer mode is engaged
    msg = client.recv(SIZE).decode(FORMAT)
    print(f"[SERVER]: {msg}")

    # Set file variables
    file_path = input("[CLIENT] Please input file path:\n> ")
    file_name = os.path.basename(file_path)
    file_extension = os.path.splitext(file_name)[1]

    # Set access mode
    read_type = "r"

    # Match case statement for access mode of different file extensions
    if (file_extension == ".png"):
        read_type = "rb"
    elif (file_extension == ".jpg"):
        read_type = "rb"
    elif (file_extension == ".txt"):
        read_type = "r"
    else:
        print(f"[CLIENT] File type not known.")
    
    # Open file
    file = open(file_path, read_type)

    #Send file name to server
    client.send(file_name.encode(FORMAT))

    # Receive confirmation of server receiving filename
    msg = client.recv(SIZE).decode(FORMAT)
    print(f"[SERVER]: {msg}")

    # if reading bytes then send data as well as end marker
    if read_type == "rb":
        data = file.read()
        encrypted_data = encrypt_data(data, key, nonce, block_counter)
        client.sendall(encrypted_data)
        client.send(b"<END>")
    else: # if not reading bytes then send utf-8 encoded data
        data = file.read(SIZE)
        client.send(data.encode(FORMAT))
    
    # Receive confirmation of file data received from server
    msg = client.recv(SIZE).decode(FORMAT)
    print(f"[SERVER]: {msg}")
    print(f"[CLIENT] File transfer is complete.")
    print(f"[CLIENT] Message can be sent to server below. Type '!FILE' to share a file.")

    # Close file when finished
    file.close()

# Define functions for receiving file
def s_file_transfer(conn, addr):

    # Let client know server is in file transfer mode
    msg = conn.send("Ready to receive file data.".encode(FORMAT))
    print(f"\r[RECV] {addr} requested to transfer a file.\n> ", end="")

    # Receive filename from client
    file_name = conn.recv(SIZE).decode(FORMAT)
    print(f"\r[RECV] Filename received: {file_name}\n> ", end="")
    conn.send("Filename received.".encode(FORMAT))

    # Retrieve file extension from file name
    file_extension = os.path.splitext(file_name)[1]
    read_type = "w"

    # Match case statement for access mode of different file extensions
    if (file_extension == ".png"):
        read_type = "wb"
    elif (file_extension == ".jpg"):
        read_type = "wb"
    elif (file_extension == ".txt"):
        read_type = "w"
    else:
        print(f"[CLIENT] File type not known.")
    
    # Open file
    file = open(file_name, read_type)

    # If writing bytes then receive as stream and look for end marker
    if read_type == "wb":
        while True:
            data = conn.recv(SIZE)
            if data[-5:] == b"<END>":
                break
            decrypted_data = decrypt_data(data, key, nonce, block_counter)
            file.write(decrypted_data)
            block_counter = increment_counter(block_counter)
    else: # If not writing bytes then decode utf-8 data
        data = conn.recv(SIZE).decode(FORMAT)
        decrypted_data = decrypt_data(data.encode(FORMAT), key, nonce, block_counter).decode(FORMAT)
        file.write(decrypted_data)
        block_counter = increment_counter(block_counter)
    
    # Close file
    file.close()

    # Confirm file data received so file transfer successful
    print(f"\r[RECV] File data received.\n> ", end="") 
    conn.send("File data received.".encode(FORMAT))
    print(f"\r[RECV] {file_name} is ready to be opened.\n> ", end="")
 
# Function to handle incoming client connections
def handle_client(conn, addr):

    # Confirm new client connected
    print(f"\r[NEW CONNECTION] {addr} connected.\n> ", end="")

    # Start connection loop
    connected = True
    while connected:

        # Receive message from client
        msg = conn.recv(SIZE).decode(FORMAT)

        # If message is disconnect command then disconnect
        if msg == DISCONNECT_MSG:
            connected = False

        # If message is file transfer command then enter file trasnfer function
        elif msg == FILE_MSG:
            s_file_transfer(conn, addr)
        
        else: # Otherwise print message and send back to client
            print(f"\r[{addr}] {msg}\n> ", end="")
            msg = f"MSG received: {msg}"
            conn.send(msg.encode(FORMAT))

    # Close connection 
    conn.close()

# Define function to handle outgoing server connections
def speak_func():

    # Enter loop while client module running
    while True:

        # Allow user enter IP to connect to, or if 'quit' entered then terminate client module
        IP = input("[CLIENT] What IP would you like to connect to? Type 'quit' to close client\n> ")
        if IP == "quit":
            os._exit(1)
            break

        # User enters port to connect to and update address variable
        PORT_SPEAK = int(input("[CLIENT] What Port would you like to use?\n"))
        ADDR_SPEAK = (IP, PORT_SPEAK)

        # Establish connection with IP and port specified
        client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            client.connect(ADDR_SPEAK)
        
            print(f"[CONNECTED] Client connected to server at {IP}:{PORT_SPEAK}")
            print(f"[CLIENT] Message can be sent to server below. Type '!FILE' to share a file")

            # Enter loop while connected to server
            connected = True
            while connected:

                # Allow user to input message
                msg = input("> ")

                # Send message to server
                client.send(msg.encode(FORMAT))

                # If message is file transfer command then enter file transfer function
                if msg == FILE_MSG:
                    c_file_transfer(client)

                # If message is disconnect command then leave connection loop
                elif msg == DISCONNECT_MSG:
                    connected = False
                else: # Otherwise receive message back from server
                    msg = client.recv(SIZE).decode(FORMAT)
                    print(f"[SERVER] {msg}")

        except socket.error:
            print(f"[ERROR] Incorrect IP or port please try again:")

# Define main entry function
def main():

    # Ask user what port the server should use
    PORT_LISTEN = int(input("[CLIENT] What Port should the server use?\n> "))

    # Assign address variable with updated server port
    ADDR_LISTEN = (IP, PORT_LISTEN)

    # Start server using specified address
    print("[STARTING] Server is starting...")
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.bind(ADDR_LISTEN)
    server.listen()

    # Confirm server is listening on specified address
    print(f"[LISTENING] Server is listening on {IP}:{PORT_LISTEN}")

    # Start separate thread for client module to operate in speak funciton
    thread = threading.Thread(target=speak_func)
    thread.start()

    # Enter loop for server to check for incoming connection requests
    while True:

        # Set connection and address to incoming client info
        conn, addr = server.accept()

        # Start separate thread for incoming client connection in handle client function
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()

        # Print number of active connections for the server
        print(f"\r[ACTIVE CONNECTIONS] {threading.active_count() - 2}\n> ", end="")


if __name__ == "__main__":
    main()