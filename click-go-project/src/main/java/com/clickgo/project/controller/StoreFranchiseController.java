package com.clickgo.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clickgo.project.dto.res.Store;
import com.clickgo.project.dto.res.StoreFranchise;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/storeFranchise")
public class StoreFranchiseController {

	@Autowired
	private StoreFranchiseService franchiseService;
	
	@Autowired
	private StoreService storeService;

	@GetMapping("/store-franchise-apply")
	public String franchiseApply() {

		return "/storeFranchise/store-franchise-apply";
	}

	@GetMapping("/store-franchise-list")
	public String franchiseList(Model model) {
		List<Store> storeList = storeService.getStoreAllList();
		model.addAttribute("storeList", storeList);
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-list";
	}

	@GetMapping("/store-franchise-message")
	public String franchiseMessage(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-message";
	}
	

	@GetMapping("/store-franchise-my")
	public String franchiseMy(Model model) {
		franchiseMassageCount(model);
		return "/storeFranchise/store-franchise-my";
	}
	
	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);
	}

}
