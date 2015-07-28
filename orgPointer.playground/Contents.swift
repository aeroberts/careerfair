//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class organizations {
    var title: String;
    var desc: String;
    
    init() {
        title = "one";
        desc = "two";
    }
    
    init(fromTitle title_in: String, desc_in: String) {
        title = title_in;
        desc = desc_in;
    }
}

var orgs = [organizations]();
orgs.append(organizations(fromTitle: "Alex", desc_in: "Is the best"));
orgs.append(organizations(fromTitle: "Kate", desc_in: "Is the second best"));
orgs.append(organizations(fromTitle: "Mike", desc_in: "not the best"));

var org = organizations(fromTitle: "Jim", desc_in: "top");

var fav = [UnsafeMutablePointer<organizations>]();
fav.append(&orgs[0]);

println(fav[0].memory.title);
println(fav[0].memory.desc);


var notedOrgs = [Int: UnsafeMutablePointer<organizations>](); // Maps orgId to org*
withUnsafeMutablePointer(&org, {(orgPtr) -> Void in
    var proof : UnsafeMutablePointer<organizations> = orgPtr;
    notedOrgs[0] = proof;})

println(notedOrgs[0]!.memory.desc);

var favoritedOrgs = [Int: UnsafeMutablePointer<organizations?>](); //

var orgId1 = 1;
withUnsafeMutablePointer(&orgs[1], {(orgPtr) -> Void in
    var currentOrgPtr : UnsafeMutablePointer<organizations?> = orgPtr;
    favoritedOrgs[orgId1] = currentOrgPtr;
})







