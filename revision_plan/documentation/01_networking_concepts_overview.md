## Networking Concepts Documentation

### 1. OSI Model as Sender

**Sending Process Overview:**
- **Application Layer (7):** User sends data using an application (e.g., web browser).
- **Presentation Layer (6):** Data is formatted, encrypted, or compressed.
- **Session Layer (5):** A connection is established between sender and receiver.
- **Transport Layer (4):** Data is divided into smaller segments (TCP/UDP).
- **Network Layer (3):** Each data segment is assigned source and destination IP addresses.
- **Data Link Layer (2):** Data is packed into frames with hardware (MAC) addresses.
- **Physical Layer (1):** Data is transmitted over a physical medium as electrical signals.

### 2. Classful IP Addressing

![Summary table for classful IP addressing](../images/Summary%20table%20for%20classful%20IP%20addressing.png)

### 3. Key Differences Between IPv4 and IPv6
- **IPv4:** 32-bit address, uses decimal format, 4.3 billion addresses.
- **IPv6:** 128-bit address, uses hexadecimal format, significantly larger address space.

![Key Differences Between IPv4 and IPv6](../images/Key%20Differences%20Between%20IPv4%20and%20IPv6.png)

### 4. Subnet Mask and How It Works
A subnet mask is a 32-bit number that divides an IP address into a network and host portion. For example:
- IP: `192.168.1.10`, Subnet Mask: `255.255.255.0`
- Network: `192.168.1.0`, Broadcast: `192.168.1.255`, Host Range: `192.168.1.1` to `192.168.1.254`.

### 5. CIDR (Classless Inter-Domain Routing)
CIDR allows more flexible IP address allocation by specifying how many bits are for the network portion. Example:
- `192.168.1.0/24`: 24 bits for network, 256 addresses.
- `192.168.1.0/28`: 28 bits for network, 16 addresses.

### 6. Calculating Number of Hosts in a Subnet
To calculate the number of hosts:
\[ \text{Hosts} = 2^n - 2 \]
Where `n` is the number of bits available for the host portion. For `/24`:
- Hosts = \( 2^8 - 2 = 254 \).

### 7. NAT (Network Address Translation) in Cloud Environments
NAT translates private IPs to a public IP for accessing the internet, used in cloud environments to allow private instances to reach external networks without exposing their IPs.

### 8. Default Gateway
A default gateway routes traffic from a local network to external networks, often a router that allows devices to connect to the internet.

### 9. VPC (Virtual Private Cloud)
A VPC is a virtual network in the cloud that allows the creation of isolated subnets, route tables, and security controls for cloud resources.

### 10. Troubleshooting Network Connectivity in DevOps
- **Ping/Traceroute:** Check connectivity and pinpoint where the failure occurs.
- **DNS Resolution:** Use `nslookup` to check if DNS is functioning.
- **Firewall Rules:** Ensure there are no blocks in security groups or ACLs.
- **Logs & Monitoring:** Review logs in cloud platforms like AWS CloudWatch or Azure Monitor.

### 11. Public vs. Private IP Addresses
- **Public IP:** Accessible globally, assigned by ISPs.
- **Private IP:** Used within local networks, not routable on the internet.

### 12. DNS in Cloud Infrastructure
DNS translates domain names to IP addresses, allowing users to access cloud resources. It supports load balancing and failover mechanisms in cloud environments.

### 13. Load Balancing in Cloud Networking
Cloud load balancers distribute traffic across servers to improve performance and availability. Considerations include access to instances across multiple subnets and health checks.

### 14. ARP (Address Resolution Protocol)
ARP maps IP addresses to MAC addresses within a local network, enabling devices to communicate with each other by resolving IP addresses to physical hardware addresses.

### 15. Network Monitoring and Troubleshooting Tools
- **Wireshark:** Packet analysis.
- **Nagios:** Monitoring network services.
- **Prometheus & Grafana:** Monitoring in cloud/container environments.

### 16. Types of Network Protocols
- **TCP/UDP:** Data transmission protocols.
- **ICMP:** Network diagnostics (e.g., `ping`).
- **HTTP/HTTPS:** Web traffic protocols.
- **FTP:** File transfer protocol.

### 17. DHCP (Dynamic Host Configuration Protocol)
DHCP automates IP address assignment to devices on a network through a 4-step process: Discover, Offer, Request, Acknowledge.

### 18. Proxy Server Functionality
A proxy server acts as an intermediary, forwarding requests and responses between clients and servers, providing caching, anonymity, and content filtering.

### 19. Stateful vs. Stateless Firewalls
- **Stateful Firewalls:** Track active connections, offering more sophisticated rule-making.
- **Stateless Firewalls:** Evaluate each packet independently based on predefined rules.

---
