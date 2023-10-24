package com.ham.len.commons;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonsVO {

	private String regId;
    private Date regDate;
    private String regMenu;
    private String modId;
    private Date modDate;
    private String modMenu;
}
