package com.toojaatte.stock.dto;

import lombok.Data;

@Data
public class StockDTO {

	private java.util.Date Date;
	private float Close, Open, High, Low, Volume, Change;
}
