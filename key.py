from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.serialization import load_pem_private_key
from cryptography.hazmat.primitives.serialization import BestAvailableEncryption
import os

# Definisci il percorso del file della chiave
key_file = "private_key.pem"
password = b'YourStrongPassword123!'  # Sostituisci con una password sicura

# Genera una chiave RSA privata
private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048,
)

# Serializza la chiave privata in formato PEM
pem = private_key.private_bytes(
    encoding=serialization.Encoding.PEM,
    format=serialization.PrivateFormat.PKCS8,
    encryption_algorithm=BestAvailableEncryption(password)
)

# Salva la chiave privata in un file
with open(key_file, 'wb') as f:
    f.write(pem)

print(f"Chiave privata salvata in {key_file}")
