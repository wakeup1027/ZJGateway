package com.solar.dao.imp;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.solar.dao.BaseDAOSupport;
import com.solar.dao.GisMapDAO;
import com.solar.po.GisMap;

@Component
public class GisMapDAOImpl extends BaseDAOSupport<GisMap> implements GisMapDAO{

	@Override
	public void addGis(GisMap gmap) {
		save(gmap);
	}

	@Override
	public List<GisMap> listCount() {
		return find("FROM GisMap");
	}

	@Override
	public List<GisMap> listPage(Integer page, Integer rows) {
		return find(page, rows, "FROM GisMap ORDER BY id DESC");
	}

	@Override
	public void delGisMap(String[] idstr) {
		for(String ch_id : idstr){
			String sql="DELETE FROM gismap WHERE id='"+Integer.parseInt(ch_id)+"'";
			SessionFactory sf = this.getSessionFactory();
			SQLQuery query=sf.openSession().createSQLQuery(sql);
		    query.executeUpdate();
		}
	}

	@Override
	public List<GisMap> MapPoint() {
		return find("FROM GisMap ORDER BY id DESC");
	}

	@Override
	public List<GisMap> findArea(String areaName) {
		return find("FROM GisMap WHERE areaName = '"+areaName+"' ORDER BY id DESC");
	}

	@Override
	public void upGis(GisMap gmap) {
		String sql = "UPDATE gismap SET commit='"+gmap.getCommit()+"', commitTitle='"+gmap.getCommitTitle()+"', xpoint='"+gmap.getXpoint()+"', ypoint='"+gmap.getYpoint()+"', areaName='"+gmap.getAreaName()+"' WHERE id = "+gmap.getId();
		SessionFactory sf = this.getSessionFactory();
		SQLQuery query=sf.openSession().createSQLQuery(sql);
	    query.executeUpdate();
	}

}
