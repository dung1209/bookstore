package bookstorePTIT.bean;
import java.util.List;

public class OrderRequest {
    private Orders order;
    private List<Order_Items> orderItems;

    // Getters and setters
    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public List<Order_Items> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<Order_Items> orderItems) {
        this.orderItems = orderItems;
    }
}
