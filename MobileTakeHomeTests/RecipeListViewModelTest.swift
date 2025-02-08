//
//  RecipeListViewModelTest.swift
//  MobileTakeHomeTests
//
//  Created by ray williams on 2/6/25.
//

import XCTest
@testable import MobileTakeHome

final class RecipeListViewModelTest: XCTestCase {

    private var recipeListVM: RecipeListViewModel!
    
    override func setUp() {
        super.setUp()
        recipeListVM = RecipeListViewModel(apiService: MockAPIService())
    }
    
    override func tearDown() {
        super.tearDown()
        recipeListVM = nil
    }
    
    func testFetchRecipe() async {
        //Arrange
        let mockAPIService = MockAPIService()
        
        do{
            let recipeArr = try await mockAPIService.getAllRecipe()
            XCTAssertEqual(recipeArr.count, 3, "Should return 3 item")
        } catch {
            XCTFail("Error unable to test fetch recipe")
        }
    }
    
    func testEmptyData() async {
        let mockAPIService = MockAPIService()
        
        do{
            let recipeArr: [Recipe] = try await mockAPIService.getAllRecipe(urlEndpoint: APIEndpoint.emptyData.path! )
            XCTAssertEqual(recipeArr.count, 0, "Should return 0 item")
        } catch {
            XCTFail("Error unable to test fetch emptyData")
        }
    }
    
    func testMalformedData() async {
        let mockAPIService = MockAPIService()
        
        do{
            let _: Recipe = try await mockAPIService.getAllRecipe(urlEndpoint: APIEndpoint.malformedData.path! )
            XCTFail("Expect data task error")
        } catch let error as APIError {
            XCTAssertEqual(error, APIError.dataTaskError, "Error unable to test malformedDate fail")
        } catch {
            XCTFail("error: \(error)")
        }
    }
    

}
