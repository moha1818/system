package com.moha.demo.model;

import com.moha.demo.entity.AsContacts;
import com.moha.demo.entity.AsCustoms;

import java.util.List;

public class CustomsView {
    private AsCustoms customs;
    private List<AsContacts> contacts;

    public List<AsContacts> getContacts() {
        return contacts;
    }

    public void setContacts(List<AsContacts> contacts) {
        this.contacts = contacts;
    }

    public AsCustoms getCustoms() {
        return customs;
    }

    public void setCustoms(AsCustoms customs) {
        this.customs = customs;
    }
}
