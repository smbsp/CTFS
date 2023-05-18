# pip install web3
# python3 findKey.py

# -*-coding:utf-8-*-
from web3 import Web3, HTTPProvider
# from pwn import log
infura_url = 'https://ropsten.infura.io/v3/e8d4e727c8bc4f97ae9cca6b5c6b6fd5'
web3 = Web3(Web3.HTTPProvider(infura_url))

a= web3.eth.get_transaction("0x061bf0b4b5fdb64ac475795e9bc5a3978f985919ce6747ce2cfbbcaccaf51009")
print("r = {0}".format(a.r.hex()))
print("s = {0}".format(a.s.hex()))
print("v= {0}".format(a.v))

a= web3.eth.get_transaction("0xd79fc80e7b787802602f3317b7fe67765c14a7d40c3e0dcb266e63657f881396")
print("r = {0}".format(a.r.hex()))
print("s = {0}".format(a.s.hex()))
print("v= {0}".format(a.v))


r = 0x69a726edfb4b802cbf267d5fd1dabcea39d3d7b4bf62b9eeaeba387606167166
# txid:
0xd79fc80e7b787802602f3317b7fe67765c14a7d40c3e0dcb266e63657f881396
s2 = 0x7724cedeb923f374bef4e05c97426a918123cc4fec7b07903839f12517e1b3c8
z2 = 0x350f3ee8007d817fbd7349c477507f923c4682b3e69bd1df5fbb93b39beb1e04
# txid:
0x061bf0b4b5fdb64ac475795e9bc5a3978f985919ce6747ce2cfbbcaccaf51009
s1 = 0x2bbd9c2a6285c2b43e728b17bda36a81653dd5f4612a2e0aefdb48043c5108de
z1 = 0x4f6a8370a435a27724bbc163419042d71b6dcbeb61c060cc6816cda93f57860c
# prime order p
p = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141
# based on Fermat's Little Theorem
# works only on prime n

def inverse_mod(a, n):
    return pow(a, n - 2, n)

k=(z1-z2)*inverse_mod(s1-s2,p)%p               #derivekfors1-s2
pk = (s1 * k - z1) * inverse_mod(r, p) % p     # derive private key 
pkNeg=(-s1*(-k%p)-z1)*inverse_mod(r,p)%p       #-k(modp)of s1 - s2 == -s1 + s2, check -s1
print('k           = {:x}'.format(k))
print('k negation  = {:x}'.format(-k % p))


if pk == pkNeg:  # should not be false
    print('private key = {:x}'.format(pk))


k=(z1-z2)*inverse_mod(s1+s2,p)%p #derivekfors1+s2
pk = (s1 * k - z1) * inverse_mod(r, p) % p # derive private key pkNeg=(-s1*(-k%p)-z1)*inverse_mod(r,p)%p #-k(modp)of s1 + s2 == -s1 - s2, double check -s1
print('k           = {:x}'.format(k))
print('k negation  = {:x}'.format(-k % p))

if pk == pkNeg:  # should not be false
    print('private key = {:x}'.format(pk))


from eth_account import Account
acct =Account.from_key("614f5e36cd55ddab0947d1723693fef5456e5bee24738ba90bd33c0c6e68e269")
print(acct.address)

