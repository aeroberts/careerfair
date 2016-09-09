#orgData[0]=(organization(fromTitle: "Microsoft", desc_in: "This is bob", note_in: "", favorited_in: false, date_in: cfDayOne, location_in: "Duderstadt Center", booth_in: 3, jobLoc_in: "Midwest", attendingRec_in: true, internshipC_in: true, fulltimeC_in: false, coopC_in: false, bachelorsC_in: true, mastersC_in: false, doctoralC_in: false, sponsorYesC_in: true, sponsorNoC_in: false, sponsorOnOccasionC_in: false, majorC_in: [1, 2, 3, 4, 5, 6, 7, 8], id_in: 0));

#yes
#|SWE/TBP Career Fair 2016 / Day 1
#|"QuadMetrics, Inc."
#|QuadMetrics uses internet scale data and machine learning to do predictive cyber risk analytics of networks. This information helps underwriters set premiums for cyber insurance and network managers understand their security posture and their exposure due to partners and vendors.
#|"Bachelors Computer Engineering,Bachelors Computer Science,Doctoral Computer Science and Engineering,Doctoral Electrical and Computer Engineering,Bachelors Electrical Engineering,Bachelors Engineering (undeclared),Masters Computer Science and Engineering,Masters Electrical and Computer Engineering"
#|On occasion
#|"Full-time,Internship"
#|Midwest
#|yes
#|yes

import re
import csv


def parseDesc(orgDesc):
    newLineDesc = re.sub(r'@#@', '\\n', orgDesc) # should just be find replace in xcode unfortunetly
    return "\"" + re.sub(r'\"', '\'', newLineDesc[1:-1]) + "\""

def parseDay(day):
    if (day == "SWE/TBP Career Fair 2016 / Day 1"):
        return "cfDayOne"
    elif (day == "SWE/TBP Career Fair 2016 / Day 2"):
        return "cfDayTwo"
    return "cfDayOne"

def parseLocation(orgName):
    location = "Duderstadt Center"
    booth = "3"

    if orgName in locationInfo:
        locData = locationInfo[orgName].split(',')[0]
        locData = locData.split('-')
        booth = int(locData[2])
        
        if (locData[1] == "BBB"):
            location = "BBB"
        elif (locData[1] == "CC"):
            location = "Chyrsler Center"
            booth += 22
        elif (locData[1] == "CH"):
            location = "Chrysler Basement"
        elif (locData[1] == "CO"):
            location = "Duderstadt Connector"
            booth += 14
        elif (locData[1] == "GA"):
            location = "Duderstadt Connector"
        elif (locData[1] == "DC"):
            location = "Duderstadt Center"
        elif (locData[1] == "DOW"):
            location = "Dow"
        elif (locData[1] == "EE"):
            location = "EECS"
        elif (locData[1] == "GGB"):
            location = "GG Brown"
        elif (locData[1] == "FXB"):
            location = "FXB"
        elif (locData[1] == "P"):
            location = "Pierpont"

        return "location_in: \"" + location + "\", booth_in: " + str(booth)

    else:
        print "Org: " + orgName + " is not present in locations.txt"
        return "location_in: " + "Duderstadt Center" + ", booth_in: " + "1"
        #Shoot


def parseJobLoc(orgLoc):
    if (orgLoc[0] == "\"" and orgLoc[-1] == "\""):
        orgLoc = orgLoc[1:-1]
    return "\"" + re.sub(',', ', ', orgLoc) + "\""

def parseReception(orgRecU, orgRecD):
    if (orgRecU == "yes" or orgRecD == "yes"):
        return "true"
    return "false"

def parseJobType(jobType):
    interns = "false"
    fulltime = "false"
    coop = "false"
    if re.search('full-*time', jobType, re.IGNORECASE):
        fulltime = "true"
    if re.search('internship', jobType, re.IGNORECASE):
        interns = "true"
    if re.search('co-*op', jobType, re.IGNORECASE):
        coop = "true"

    return ", internshipC_in: " + interns + ", fulltimeC_in: " + fulltime + ", coopC_in: " + coop

def parseDegree(majors):
    bachelor = "false"
    masters = "false"
    doctors = "false"

    if re.search('bachelor', majors, re.IGNORECASE):
        bachelor = "true"
    if re.search('master', majors, re.IGNORECASE):
        master = "true"
    if re.search('doctoral', majors, re.IGNORECASE):
        doctors = "true"

    return ", bachelorsC_in: " + bachelor + ", mastersC_in: " + masters + ", doctoralC_in: " + doctors

def parseSponsor(spons):
    yes = "false"
    no = "false"
    sometimes = "false"

    if re.search('yes', spons, re.IGNORECASE):
        bachelor = "true"
    if re.search('no', spons, re.IGNORECASE):
        master = "true"
    if re.search('on occasion"', spons, re.IGNORECASE):
        doctors = "true"

    return ", sponsorYesC_in: " + yes + ", sponsorNoC_in: " + no + ", sponsorOnOccasionC_in: " + sometimes

def parseMajor(major):
    majors = ", majorC_in: ["
    if re.search('aerospace', major, re.IGNORECASE):
        majors += str(0) + ", "
    if re.search('atmospheric', major, re.IGNORECASE):
        majors += str(1) + ", "
    if re.search('biomedical', major, re.IGNORECASE):
        majors += str(2) + ", "
    if re.search('chemical', major, re.IGNORECASE):
        majors += str(3) + ", "
    if re.search('civil', major, re.IGNORECASE):
        majors += str(4) + ", "
    if re.search('computer engin', major, re.IGNORECASE):
        majors += str(5) + ", "
    if re.search('computer science', major, re.IGNORECASE):
        majors += str(6) + ", "
    if re.search('data science', major, re.IGNORECASE):
        majors += str(7) + ", "
    if re.search('electrical', major, re.IGNORECASE):
        majors += str(8) + ", "
    if re.search('physics', major, re.IGNORECASE):
        majors += str(9) + ", "
    if re.search('environmental', major, re.IGNORECASE):
        majors += str(10) + ", "
    if re.search('industrial', major, re.IGNORECASE):
        majors += str(11) + ", "
    if re.search('materials', major, re.IGNORECASE):
        majors += str(12) + ", "
    if re.search('mechanical', major, re.IGNORECASE):
        majors += str(13) + ", "
    if re.search('naval', major, re.IGNORECASE):
        majors += str(14) + ", "
    if re.search('nuclear', major, re.IGNORECASE):
        majors += str(15) + ", "
    if re.search('all major', major, re.IGNORECASE):
        return ', majorC_in: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]'

    if (majors == ", majorC_in: ["):
        return majors + "]"
    majors = majors[:-2]
    majors += "]"
    return majors

def parseTitle(title):
    if (title[0] == "\"" and title[-1] == "\""):
        return title[1:-1]
    return title

locationInfo = {}
with open('location.txt', 'rb') as csvLoc:
    reader = csv.reader(csvLoc, delimiter='|', quotechar='`')
    for row in reader:
        locationInfo[row[1]] = row[0]

orgInfo = []
with open('tab.txt', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter='|', quotechar='`')
    for row in spamreader:
        orgInfo += [row[0:10]]


count = 0
for org in orgInfo:
    if (count == 0):
        count += 1
        continue

    orgString = "orgData[" + str(count) + "]=(organization(fromTitle: \"" + parseTitle(org[2]) + \
                "\", desc_in: " + parseDesc(org[3]) + \
                ", note_in: \"\", favorited_in: false, date_in: " + parseDay(org[1]) + ", " + \
                parseLocation(org[2]) + \
                ", jobLoc_in: " + parseJobLoc(org[7]) + \
                ", attendingRec_in: " + parseReception(org[8], org[9]) +\
                parseJobType(org[6]) +\
                parseDegree(org[4]) +\
                parseSponsor(org[5]) +\
                parseMajor(org[4]) +\
                ", id_in: " + str(count) + '));'


    print orgString
    count += 1

