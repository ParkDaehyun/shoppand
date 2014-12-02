package com.pdh.shoppand_17.service;

public class CollaborativeFiltering {
	private double p_a;
	private double[] p_i;
	private double[] p_ai;
	private double[] w_ai;
	private double k_a;
	private double[] p_aj;
	private int[] recommend;
	
	public int[] cal(int[] user, int[][] data) {
		p_a = 0;
		p_i = new double [data.length];
		p_ai = new double [data.length];
		w_ai = new double [data.length];
		k_a = 0;
		p_aj = new double [data[0].length];
		recommend = new int [data[0].length];
		double temp = 0;
		double temp2 = 0;
		
		for (int i = 0; i < user.length; i++) {
			if (user[i] == 1) {
				temp++;
			}
		}
		p_a = temp / user.length;

		for (int i = 0; i < data.length; i++) {
			temp = 0;
			temp2 = 0;
			for (int j = 0; j < data[0].length; j++) {
				if (data[i][j] == 1) {
					temp++;
				}
				if (data[i][j] == 1 && user[j] == 1) {
					temp2++;
				}
			}
			p_i[i] = temp / data[0].length;
			p_ai[i] = temp2 / data[0].length;
		}

		w_ai = cal_w_ai(p_a, p_i, p_ai);
		
		k_a = cal_k(w_ai);
		
		for (int i = 0; i < data[0].length; i++) {
			temp = 0;
			for (int j = 0; j < data.length; j++) {
				temp += w_ai[j] * data[j][i];
			}
			p_aj[i] = k_a * temp;
			if (p_aj[i] > 0 && user[i] == 0) {
				recommend[i] = 1;
			}
		}
		
		return recommend;
	}
	
	public double[] cal_w_ai(double p_a, double[] p_i, double[] p_ai) {
		double[] w_ai = new double [p_i.length];;

		for (int i = 0; i < p_i.length; i++) { 
			w_ai[i] = (p_ai[i]-p_a*p_i[i]) / (Math.sqrt(p_a*(1-p_a)) * Math.sqrt(p_i[i]*(1-p_i[i])));
		}
		
		return w_ai;
	}
	
	public double cal_k(double[] w_ai) {
		double k = 0;

		for (int i = 0; i < w_ai.length; i++) {
			k += Math.abs(w_ai[i]);
		}
		
		return (1 / k);
	}
}