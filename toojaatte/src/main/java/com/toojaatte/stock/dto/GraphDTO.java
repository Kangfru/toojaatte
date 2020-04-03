package com.toojaatte.stock.dto;

import lombok.Data;

@Data
public class GraphDTO {

	private String date;
	private String open, high, low, close, volume, change;
	
}
