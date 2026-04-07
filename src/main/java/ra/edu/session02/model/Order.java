package ra.edu.session02.model;

import java.util.Date;

public class Order {

    private String id;
    private String productName;
    private double totalPrice;
    private Date orderDate;

    public Order(String id, String productName, double totalPrice, Date orderDate) {
        this.id = id;
        this.productName = productName;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
    }

    public String getId() {
        return id;
    }

    public String getProductName() {
        return productName;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }
}