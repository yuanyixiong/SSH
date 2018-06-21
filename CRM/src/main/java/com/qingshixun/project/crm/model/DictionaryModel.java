package com.qingshixun.project.crm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "qsx_dictionary")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "CategoryCode", discriminatorType = DiscriminatorType.STRING)
// 数据字典管理
public class DictionaryModel implements Serializable, Comparable {

    private static final long serialVersionUID = 5691965459033202174L;

    // 编码
    @Id
    private String code;

    // 类型
    @Transient
    private String type;

    // 名称
    @Column
    private String name;

    // 描述
    @Column
    private String description;

    // 顺序
    @Column(nullable = false)
    private int indexNo;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((code == null) ? 0 : code.hashCode());
        return result;
    }

    public int getIndexNo() {
        return indexNo;
    }

    public void setIndexNo(int indexNo) {
        this.indexNo = indexNo;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final DictionaryModel other = (DictionaryModel) obj;
        if (code == null) {
            if (other.code != null)
                return false;
        } else if (!code.equals(other.code))
            return false;
        return true;
    }

    @Override
    public int compareTo(Object o) {
        DictionaryModel obj = (DictionaryModel) o;
        if (this.getIndexNo() == obj.getIndexNo()) { // ==时，根据code排序
            return this.getCode().compareTo(obj.getCode());
        } else {
            return this.getIndexNo() - obj.getIndexNo();
        }
    }

}
