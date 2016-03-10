//
//  PlanData+CoreDataProperties.h
//  
//
//  Created by admin on 16/3/2.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PlanData.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlanData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *time;
@property (nullable, nonatomic, retain) NSString *medicine;
@property (nullable, nonatomic, retain) NSString *remark;
@property (nullable, nonatomic, retain) NSString *times;
@property (nullable, nonatomic, retain) NSString *iseating;
@property (nullable, nonatomic, retain) NSString *name;
@end

NS_ASSUME_NONNULL_END
