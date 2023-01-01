package com.clickgo.project.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.clickgo.project.auth.PrincipalDetails;
import com.clickgo.project.entity.Category;
import com.clickgo.project.entity.Store;
import com.clickgo.project.entity.StoreFranchise;
import com.clickgo.project.model.enums.RoleType;
import com.clickgo.project.model.enums.StoreCategory;
import com.clickgo.project.service.CategoryService;
import com.clickgo.project.service.StoreFranchiseService;
import com.clickgo.project.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreFranchiseService franchiseService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private CategoryService categoryService;

	private Page<Store> stores;

	@GetMapping("/main")
	public String store(@RequestParam(required = false) String pageName, Model model,
			@PageableDefault(size = 3, sort = "id", direction = Direction.DESC) Pageable pageable) {
		List<StoreCategory> categories = new ArrayList<>();
		List<Category> categoryEntitys = categoryService.findAll();
		categoryEntitys.forEach(t -> {
			categories.add(t.getId());
		}); 
		if (pageName == null) {
			stores = storeService.getStoreAllList(pageable);
		} else {
			stores = storeService.findAllByStoreCategory(pageName, pageable);
		}

		model.addAttribute("nowPage", pageName);
		model.addAttribute("categories", categories);
		model.addAttribute("stores", stores);
		franchiseMassageCount(model);
		return "store/store-main";
	}

	public void franchiseMassageCount(Model model) {
		List<StoreFranchise> franchiseMessages = franchiseService.getMessageList();
		model.addAttribute("message", franchiseMessages);

		List<StoreFranchise> allMsg = franchiseService.getMessageList();
		franchiseMessages.forEach(t -> {
			if (t.getState().toString().equals("WAIT")) {
				allMsg.add(t);
			}
		});
		int waitMsg = allMsg.size() - franchiseMessages.size();
		model.addAttribute("waitMsg", waitMsg);
	}

	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Store storeEntity = storeService.findById(id);
		RoleType role = principalDetails.getUser().getRole();
		System.out.println(storeEntity);
		model.addAttribute("store", storeEntity);
		model.addAttribute("role", role);
		return "/store/detail";
	}

	@GetMapping("/map")
	public String map() {
		return "/store/map";
	}
}
