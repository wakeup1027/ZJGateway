package com.solar.dao.imp;

import java.util.List;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Component;

import com.solar.dao.BaseDAOSupport;
import com.solar.dao.GatewayDAO;
import com.solar.po.Gateway;

@Component
public class GatewayDAOImp extends BaseDAOSupport<Gateway> implements GatewayDAO {

	@Override
	public void add(Gateway gateway) {
		System.out.println("qqqq:"+JSONArray.fromObject(gateway));
		save(gateway);
		
	}

	@Override
	public List<Gateway> listAll() {
		String hql = "from Gateway where 1=1";
		return find(hql);
	}

	@Override
	public List<Gateway> list(Integer page, Integer rows) {
		String hql = "from Gateway where 1=1";
		return find(page, rows, hql);
	}

	@Override
	public void deleteLots(String [] idLots) {
		for(int i=0;i<idLots.length;i++){
			delete(get("from Gateway where id=?", Integer.parseInt(idLots[i])));
		}
	}

}
