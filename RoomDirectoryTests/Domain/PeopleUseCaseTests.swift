//
//  PeopleUseCaseTests.swift
//  RoomDirectoryTests
//
//  Created by Donald Daniels on 17/07/2022.
//

import XCTest
@testable import RoomDirectory

class PeopleUseCaseTests: XCTestCase {

    var peopleUseCase: PeopleUseCase!
    let mockRepository = MockPeopleRepository()
    override func setUpWithError() throws {
       
        peopleUseCase = DefaultPeopleUseCase(peoplesRepository: mockRepository)
    }

    override func tearDownWithError() throws {
        peopleUseCase = nil
    }

    // when people records success
    func testGetPeopleSuccess() async {
       
        mockRepository.enqueuePeopelesRecords(peoplesRecords: [PeopleRecord(firstName:"test", avatar: "test", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
      let peopleRecords =  try? await peopleUseCase.execute()
        
        XCTAssertEqual(peopleRecords?.count, 1)
        XCTAssertEqual(peopleRecords?.first?.firstName, "test")

    }
    
    
    // when people records fail to fetch data
    func testGetPeopleFailure() async {

        do {
            _ =  try await peopleUseCase.execute()

        }catch {
            XCTAssertEqual(error as! APIError, .invalidData)

        }
    }
    
    
    // when people get image success
    func testGetPeopleImageSuccess() async {
       
        // GIVEN
        mockRepository.enqueuePeopelesRecords(peoplesRecords: [PeopleRecord(firstName:"test", avatar: "valid", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
      let _ =  try? await peopleUseCase.execute()
        
        // When
        
        let imageData = try? await peopleUseCase.getImage(for: "valid")
        
        XCTAssertNotNil(imageData)

    }
    
    // when people get image failure
    func testGetPeopleImageFails() async {
       
        // GIVEN
        mockRepository.enqueuePeopelesRecords(peoplesRecords: [PeopleRecord(firstName:"test", avatar: "invalid", lastName: "test", email: "test", jobTitle: "test", joinedDate:"test")])
      let _ =  try? await peopleUseCase.execute()
        
        // When
        
        let imageData = try? await peopleUseCase.getImage(for: "invalid")
        
        XCTAssertNil(imageData)

    }
}

