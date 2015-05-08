package org.stan.yxgz.tree;

import java.util.ArrayList;
import java.util.List;


/**
 * 类名：TreeElement.java
* 类描述：树形结构节点类
 * @author lan
 * 创建时间：2014-3-23 10:32
 */
public class TreeElement {

    private static final long serialVersionUID = -2318709857305103363L;

    String id = null;// 当前节点id
    String name = null;// 当前节点文字
    String type = null;//类型 是平面报表还是多维的
    boolean isParent = false;// 当前节点是否有父节点
    boolean hasChild = false;// 当前节点是否有子节点
    boolean childShow = false;// 如果子节点，字节当当前是否已显示
    String pId = null;// 父节点id
    int level = -1;// 当前界面层级
    boolean fold = false;// 是否处于展开状态
 
	
	
	/**
	 * 是否显示复选框
	 */
	private boolean nocheck;
	
	/**
	 * 是否选中
	 */
	private boolean checked;
	

	private List<TreeElement> children = new ArrayList<TreeElement>(); 
    
    public boolean isChildShow() {
       return childShow;
    }
 
    public void setChildShow(boolean childShow) {
       this.childShow = childShow;
    }
 
    public String getId() {
        return id;
    }
 
    public void setId(String id) {
       this.id = id;
    }
 
  
 
    public boolean isHasChild() {
       return hasChild;
    }
 
    public void setHasChild(boolean hasChild) {
       this.hasChild = hasChild;
    }
 
    public int getLevel() {
       return level;
    }
 
    public void setLevel(int level) {
       this.level = level;
    }
 
    public boolean isFold() {
       return fold;
    }
 
    public void setFold(boolean fold) {
       this.fold = fold;
    }
 
    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public boolean getIsParent() {
		return isParent;
	}

	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public boolean isNocheck() {
		return nocheck;
	}

	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<TreeElement> getChildren() {
		return children;
	}

	public void setChildren(List<TreeElement> children) {
		this.children = children;
	}
	
	
}