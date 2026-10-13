# e-commerce database

## system requirements document(SRD)

## 1. introduction

- document defines the core entities for an e-commerce system

---
## 2. system overview 

- system consists of six core entities : 
-   Product Catalog Management
-   Customer Info
-   Payment Transaction
-   Shipping
-   Reviews and Ratings

---
## 3. functional system entities

### 3.1 Product Catalog
> stores info about all products 

| Product Catalog  | Attributes                               |
| :--------------- | :--------------------------------------- |
| **Product Name** | the display name of the product          |
| **Description**  | detailed text description of the product |
| **Price**        | selling price of the product             |
| **Quantity**     | current count avaliable for purchase     |
| **Images**       | One or more product images               |

---

### 3.2 Customer Info

>stores all registered users information

| Customer Info     | Attributes                                 |
| :---------------- | :----------------------------------------- |
| **Customer Name** | the display name of the customer           |
| **Contacts**      | phone number and email                     |
| **Address**       | address that orders will being shipping on |
| **Login Info**    | usernaem and password                      |

---

### 3.3 Order Info

> stores all data related to customer orders

| Order Info      | Attributes                               |
|:---------------|:------------------------------------------|
|**Order Non.**   |unique number for each order              |
|**Customer Info**|info of customer who placed the order     |
|**Date & Time**  |Timestamp when order placed               |
|**Products**     |list of product items                     |
|**Order Status** |current status of the order               |

>**Status Value** : `Pending` → `Processing` → `Shipped` → `Delivered`

--- 
### 3.4 Payment Transaction 

> save all **orders payments** (`Transaction log`)

| Payment Transaction | Attributes                                               |
| :------------------ | :------------------------------------------------------- |
| **Transaction ID**  | Unique no. for each payment                              |
| **Customer ID**     | reference to customer making it                          |
| **Payment Amount**  | total amount charged                                     |
| **Payment Method**  | the method used (e.g. `credit card`, `cash on delivery`) |
| **Timestamp**       | date and time of precess the transaction                 |

---

### 3.5 Shipping

>tracks all shipping info for orders

| Shipping               | Attributes                       |
| :--------------------- | :------------------------------- |
| **Order ID**           | reference to order               |
| **Shipping Carrier**   | name and details of carrier      |
| **Tracking Number**    | tracking code for shipping       |
| **Shipping Status**    | current shipping status of order |
| **Estimated Delivery** | expected arrival date            |
| **Actual Delivery**    | actual date of delivery          |
| **Notes**              | any comment or updates notes     |

>**Status Value** : `Processing` → `Out for Delivery` → `Delivered`


---

### 3.6 Reviews and Ratings

> stores customer feedback and rating after delivered orders

| Reviews and Ratings | Attributes                                           |
| :------------------ | :--------------------------------------------------- |
| **Product ID**      | reference to the product                             |
| **Customer ID**     | reference to customer who submitted the review       |
| **Review Text**     | customer feedback                                    |
| **Rating Score**    | numeric rating from 1 to 5 (`1`, `2`, `3`, `4`, `5`) |
| **Timestamp**       | date and time of review                              |
