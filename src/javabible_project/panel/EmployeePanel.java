package javabible_project.panel;

import javax.swing.JPanel;
import java.awt.GridLayout;
import java.util.Vector;

import erp_myframework.TextFiledPanel;
import javabible_project.dto.Employee;
import erp_myframework.ComboPanel;

public class EmployeePanel extends JPanel {
	private TextFiledPanel pCode;
	private TextFiledPanel pName;
	private ComboPanel pGrade;

	
	public EmployeePanel() {
		setLayout(new GridLayout(0, 1, 0, 0));
		
		pCode = new TextFiledPanel();
		pCode.setTitle("사원코드");
		add(pCode);
		
		pName = new TextFiledPanel();
		pName.setTitle("사 원 명");
		add(pName);
		
		Vector<String> list = new Vector<>();
		list.add("A");
		list.add("B");
		list.add("C");
		
		pGrade = new ComboPanel();
		pGrade.setTitle("사원등급");
		pGrade.setcomboData(list);
		add(pGrade);

	}

}
