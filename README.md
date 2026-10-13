# E-Commerce Database

## System Requirements Document (SRD)

## Table of Contents

1. [Introduction](#1-introduction)
2. [System Overview](#2-system-overview)
3. [Functional System Entities](#3-functional-system-entities)
   - [3.1 Product Catalog](#31-product-catalog)
   - [3.2 Customer Info](#32-customer-info)
   - [3.3 Order Info](#33-order-info)
   - [3.4 Payment Transaction](#34-payment-transaction)
   - [3.5 Shipping](#35-shipping)
   - [3.6 Reviews and Ratings](#36-reviews-and-ratings)
4. [Entity Relationships](#4-entity-relationships)

---

## 1. Introduction

This document defines the core entities of an e-commerce system and the attributes each one stores.

---

## 2. System Overview

The system consists of **six core entities**:

1. Product Catalog
2. Customer Info
3. Order Info
4. Payment Transaction
5. Shipping
6. Reviews and Ratings

---

## 3. Functional System Entities

### 3.1 Product Catalog

> Stores information about all products.

| Attribute        | Description                              |
| :--------------- | :--------------------------------------- |
| **Product Name** | The display name of the product          |
| **Description**  | Detailed text description of the product |
| **Price**        | Selling price of the product             |
| **Quantity**     | Current stock available for purchase     |
| **Images**       | One or more product images               |

---

### 3.2 Customer Info

> Stores information about all registered customers.

| Attribute         | Description                                      |
| :---------------- | :----------------------------------------------- |
| **Customer Name** | The display name of the customer                 |
| **Contacts**      | Phone number and email                           |
| **Address**       | Address that orders will be shipped to           |
| **Login Info**    | Username and password (stored as a secure hash)  |

---

### 3.3 Order Info

> Stores all data related to customer orders.

| Attribute          | Description                              |
| :----------------- | :--------------------------------------- |
| **Order No.**      | Unique number for each order             |
| **Customer Info**  | The customer who placed the order        |
| **Date & Time**    | Timestamp of when the order was placed   |
| **Products**       | List of ordered product items            |
| **Order Status**   | Current status of the order              |

**Order Status flow:** `Pending` → `Processing` → `Shipped` → `Delivered`

---

### 3.4 Payment Transaction

> Stores all order payments (transaction log).

| Attribute          | Description                                                  |
| :----------------- | :----------------------------------------------------------- |
| **Transaction ID** | Unique number for each payment                               |
| **Customer ID**    | Reference to the customer who made the payment               |
| **Payment Amount** | Total amount charged                                         |
| **Payment Method** | Method used (e.g. `Credit Card`, `Cash on Delivery`)         |
| **Timestamp**      | Date and time the transaction was processed                  |

---

### 3.5 Shipping

> Tracks all shipping information for orders.

| Attribute              | Description                          |
| :--------------------- | :----------------------------------- |
| **Order ID**           | Reference to the order               |
| **Shipping Carrier**   | Name and details of the carrier      |
| **Tracking Number**    | Tracking code for the shipment       |
| **Shipping Status**    | Current shipping status of the order |
| **Estimated Delivery** | Expected arrival date                |
| **Actual Delivery**    | Actual date of delivery              |
| **Notes**              | Comments or update notes             |

**Shipping Status flow:** `Processing` → `Out for Delivery` → `Delivered`

---

### 3.6 Reviews and Ratings

> Stores customer feedback and ratings after orders are delivered.

| Attribute        | Description                                          |
| :--------------- | :--------------------------------------------------- |
| **Product ID**   | Reference to the reviewed product                    |
| **Customer ID**  | Reference to the customer who submitted the review   |
| **Review Text**  | Customer feedback                                    |
| **Rating Score** | Numeric rating from 1 to 5                           |
| **Timestamp**    | Date and time the review was submitted               |

---

## 4. Entity Relationships

| Relationship                       | Type         |
| :--------------------------------- | :----------- |
| Customer → Order                   | One to many  |
| Order ↔ Product                    | Many to many |
| Order → Payment Transaction        | One to many  |
| Order → Shipping                   | One to one   |
| Customer → Review                  | One to many  |
| Product → Review                   | One to many  |
