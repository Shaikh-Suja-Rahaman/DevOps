```bash
ifconfig -a
```


#ip address -- unique number identifier for a device connected
#to the internet

class A : 0 - 127 
 - Even if we are not using 127, we still need to include it. 
class B : 128 - 191
class C : 
class D :

0.0.0.0 - 255.255.255.255

subnetmask: to differenciate the host part and network part
255.0.0.0 - class A

120.27.1.0 - 255.0.0.0
class A
32 bits IP
class A has 8 bits network part
32-8 = 24 host part

120.27.1.0/8 - we have here 8 network bits, rest are host bits
32-8 = 24 host bits



255.0.0.0 - class A
255.255.0.0 - class B
255.255.255.0 - class C

---

finding host

---

```bash
ip route #for checking routes

nslookup google.com #dns servers for google

curl google.com #check endpoint for gooogle

curl -I google.com #we are getting headers with -I

ss -tuln

traceroute google.com

```