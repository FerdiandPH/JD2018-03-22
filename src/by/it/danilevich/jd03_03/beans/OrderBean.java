package by.it.danilevich.jd03_03.beans;

import java.io.Serializable;
import java.util.Objects;

public class OrderBean implements Serializable {
    private int id;
    private int dateOrder;
    private int clientId;
    private int kindOfWorkId;
    private int executorId;
    private int adminId;
    private int beginWork;
    private int planEndWork;
    private int endWork;
    private int amount;
    private double totalMoney;
    private double totalTime;
    private String status;

    public OrderBean() {
    }

    public int getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(int dateOrder) {
        this.dateOrder = dateOrder;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getKindOfWorkId() {
        return kindOfWorkId;
    }

    public void setKindOfWorkId(int kindOfWorkId) {
        this.kindOfWorkId = kindOfWorkId;
    }

    public int getExecutorId() {
        return executorId;
    }

    public void setExecutorId(int executorId) {
        this.executorId = executorId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public int getBeginWork() {
        return beginWork;
    }

    public void setBeginWork(int beginWork) {
        this.beginWork = beginWork;
    }

    public int getPlanEndWork() {
        return planEndWork;
    }

    public void setPlanEndWork(int planEndWork) {
        this.planEndWork = planEndWork;
    }

    public int getEndWork() {
        return endWork;
    }

    public void setEndWork(int endWork) {
        this.endWork = endWork;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public double getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(double totalTime) {
        this.totalTime = totalTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public OrderBean(int id, int dateOrder, int clientId, int kindOfWorkId, int executorId, int adminId, int beginWork, int planEndWork, int endWork, int amount, double totalMoney, double totalTime, String status) {
        this.id = id;
        this.dateOrder = dateOrder;
        this.clientId = clientId;
        this.kindOfWorkId = kindOfWorkId;
        this.executorId = executorId;
        this.adminId = adminId;
        this.beginWork = beginWork;
        this.planEndWork = planEndWork;
        this.endWork = endWork;
        this.amount = amount;
        this.totalMoney = totalMoney;
        this.totalTime = totalTime;
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderBean orderBean = (OrderBean) o;
        return id == orderBean.id &&
                Objects.equals(dateOrder, orderBean.dateOrder);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, dateOrder);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "OrderBean{" +
                "id=" + id +
                ", dateOrder='" + dateOrder + '\'' +
                ", clientId=" + clientId +
                ", kindOfWorkId=" + kindOfWorkId +
                '}';
    }
}
