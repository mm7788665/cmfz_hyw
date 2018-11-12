package com.baizhi.entity;

import java.util.List;

public class Gurn {
    private String id;
    private String name;
    private String headPic;
    private String gender;
    private List<Article> lists;

    @Override
    public String toString() {
        return "Gurn{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", headPic='" + headPic + '\'' +
                ", gender='" + gender + '\'' +
                ", lists=" + lists +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public List<Article> getLists() {
        return lists;
    }

    public void setLists(List<Article> lists) {
        this.lists = lists;
    }

    public Gurn(String id, String name, String headPic, String gender, List<Article> lists) {

        this.id = id;
        this.name = name;
        this.headPic = headPic;
        this.gender = gender;
        this.lists = lists;
    }

    public Gurn() {

    }
}
