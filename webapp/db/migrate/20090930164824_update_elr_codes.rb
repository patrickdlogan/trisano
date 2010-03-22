class UpdateElrCodes < ActiveRecord::Migration

  def self.up
    if RAILS_ENV == 'production'
      begin
        execute "UPDATE diseases SET disease_name='Cholera' where disease_name='Cholera ';"
        execute "UPDATE diseases SET disease_name='Psittacosis' where disease_name='Psittacosis ';"
        execute "UPDATE diseases SET disease_name='Creutzfeldt-Jakob Disease and Other Transmissible Human Spongiform Encephalopathies' where disease_name='Creutzfeldt-Jakob Disease and Other Transmissible Human Spongiform Encephalopathies ';"

        puts 'Loading disease to loinc assocaitions'
        LoincCode.associate_diseases_from_csv(associations)
      rescue
        puts $!
      else
        puts 'Associations loaded successfully'
      end
    end
  end

  def self.down
  end

  def self.associations
    <<-CSV
AMEBIASIS,10356-4
AMEBIASIS,10643-5
AMEBIASIS,10701-1
AMEBIASIS,10702-9
AMEBIASIS,10703-7
AMEBIASIS,10704-5
AMEBIASIS,14125-9
AMEBIASIS,18307-9
AMEBIASIS,20932-0
AMEBIASIS,29905-7
AMEBIASIS,5151-6
AMEBIASIS,6396-6
AMEBIASIS,6397-4
AMEBIASIS,6398-2
AMEBIASIS,6399-0
AMEBIASIS,6470-9
AMEBIASIS,6473-3
AMEBIASIS,6594-6
AMEBIASIS,665-0
AMEBIASIS,6665-4
AMEBIASIS,6674-6
AMEBIASIS,6680-3
AMEBIASIS,673-4
AMEBIASIS,678-3
AMEBIASIS,680-9
AMEBIASIS,9785-7
ANTHRAX,11469-4
ANTHRAX,11475-1
ANTHRAX,38347-1
ANTHRAX,610-6
"Botulism, foodborne",11470-2
"Botulism, foodborne",11475-1
"Botulism, foodborne",20706-8
"Botulism, foodborne",33694-1
"Botulism, foodborne",33696-6
"Botulism, foodborne",41852-5
"Botulism, foodborne",46705-0
"Botulism, foodborne",6463-4
"Botulism, infant",11470-2
"Botulism, infant",11475-1
"Botulism, infant",20706-8
"Botulism, infant",33694-1
"Botulism, infant",33696-6
"Botulism, infant",41852-5
"Botulism, infant",46705-0
"Botulism, infant",6463-4
"Botulism, other unspecified",11470-2
"Botulism, other unspecified",11475-1
"Botulism, other unspecified",20706-8
"Botulism, other unspecified",33694-1
"Botulism, other unspecified",33696-6
"Botulism, other unspecified",41852-5
"Botulism, other unspecified",46705-0
"Botulism, other unspecified",6463-4
"Botulism, wound",11470-2
"Botulism, wound",11475-1
"Botulism, wound",20706-8
"Botulism, wound",33694-1
"Botulism, wound",33696-6
"Botulism, wound",41852-5
"Botulism, wound",46705-0
"Botulism, wound",6463-4
"Botulism, other (includes wound)",11470-2
"Botulism, other (includes wound)",11475-1
"Botulism, other (includes wound)",20706-8
"Botulism, other (includes wound)",33694-1
"Botulism, other (includes wound)",33696-6
"Botulism, other (includes wound)",41852-5
"Botulism, other (includes wound)",46705-0
"Botulism, other (includes wound)",6463-4
BRUCELLOSIS,10349-9
BRUCELLOSIS,11475-1
BRUCELLOSIS,13210-0
BRUCELLOSIS,22151-5
BRUCELLOSIS,24388-1
BRUCELLOSIS,5066-6
BRUCELLOSIS,5067-4
BRUCELLOSIS,5068-2
BRUCELLOSIS,5069-0
BRUCELLOSIS,5071-6
BRUCELLOSIS,551-2
BRUCELLOSIS,552-0
BRUCELLOSIS,600-7
BRUCELLOSIS,627-0
BRUCELLOSIS,6324-8
BRUCELLOSIS,6326-3
BRUCELLOSIS,634-6
BRUCELLOSIS,636-1
BRUCELLOSIS,6911-2
BRUCELLOSIS,699-9
Cache Valley virus non-neuroinvasive disease,10896-9
Cache Valley virus non-neuroinvasive disease,10897-7
Cache Valley virus non-neuroinvasive disease,10898-5
Cache Valley virus non-neuroinvasive disease,10899-3
Cache Valley virus non-neuroinvasive disease,10904-1
Cache Valley virus non-neuroinvasive disease,10905-8
Cache Valley virus non-neuroinvasive disease,10906-6
Cache Valley virus non-neuroinvasive disease,10907-4
Cache Valley virus non-neuroinvasive disease,13228-2
Cache Valley virus non-neuroinvasive disease,13229-0
Cache Valley virus non-neuroinvasive disease,13230-8
Cache Valley virus non-neuroinvasive disease,13231-6
Cache Valley virus non-neuroinvasive disease,17036-5
Cache Valley virus non-neuroinvasive disease,17037-3
Cache Valley virus non-neuroinvasive disease,17038-1
Cache Valley virus non-neuroinvasive disease,17039-9
Cache Valley virus non-neuroinvasive disease,17769-1
Cache Valley virus non-neuroinvasive disease,17770-9
Cache Valley virus non-neuroinvasive disease,21509-5
Cache Valley virus non-neuroinvasive disease,21510-3
Cache Valley virus non-neuroinvasive disease,23046-6
Cache Valley virus non-neuroinvasive disease,23991-3
Cache Valley virus non-neuroinvasive disease,23992-1
Cache Valley virus non-neuroinvasive disease,29783-8
Cache Valley virus non-neuroinvasive disease,29785-3
Cache Valley virus non-neuroinvasive disease,29789-5
Cache Valley virus non-neuroinvasive disease,30174-7
Cache Valley virus non-neuroinvasive disease,30175-4
Cache Valley virus non-neuroinvasive disease,30176-2
Cache Valley virus non-neuroinvasive disease,30177-0
Cache Valley virus non-neuroinvasive disease,30179-6
Cache Valley virus non-neuroinvasive disease,33295-7
Cache Valley virus non-neuroinvasive disease,34450-7
Cache Valley virus non-neuroinvasive disease,37983-4
Cache Valley virus non-neuroinvasive disease,37984-2
Cache Valley virus non-neuroinvasive disease,41878-0
Cache Valley virus non-neuroinvasive disease,5073-2
Cache Valley virus non-neuroinvasive disease,5134-2
Cache Valley virus non-neuroinvasive disease,5406-4
Cache Valley virus non-neuroinvasive disease,5883-4
Cache Valley virus non-neuroinvasive disease,5884-2
Cache Valley virus non-neuroinvasive disease,5888-3
Cache Valley virus non-neuroinvasive disease,6309-9
Cache Valley virus non-neuroinvasive disease,6310-7
Cache Valley virus non-neuroinvasive disease,6383-4
Cache Valley virus non-neuroinvasive disease,6388-3
Cache Valley virus non-neuroinvasive disease,6389-1
Cache Valley virus non-neuroinvasive disease,6549-0
Cache Valley virus non-neuroinvasive disease,6585-4
Cache Valley virus non-neuroinvasive disease,6586-2
Cache Valley virus non-neuroinvasive disease,6812-2
Cache Valley virus non-neuroinvasive disease,6957-5
Cache Valley virus non-neuroinvasive disease,6958-3
Cache Valley virus non-neuroinvasive disease,7860-0
Cache Valley virus non-neuroinvasive disease,7861-8
Cache Valley virus non-neuroinvasive disease,7938-4
Cache Valley virus non-neuroinvasive disease,7940-0
Cache Valley virus non-neuroinvasive disease,7941-8
Cache Valley virus non-neuroinvasive disease,8016-8
Cache Valley virus non-neuroinvasive disease,8017-6
Cache Valley virus non-neuroinvasive disease,8021-8
Cache Valley virus non-neuroinvasive disease,8023-4
Cache Valley virus non-neuroinvasive disease,8025-9
Cache Valley virus non-neuroinvasive disease,8052-3
Cache Valley virus non-neuroinvasive disease,8053-1
Cache Valley virus non-neuroinvasive disease,9314-6
Cache Valley virus non-neuroinvasive disease,9315-3
Cache Valley virus non-neuroinvasive disease,9316-1
Cache Valley virus non-neuroinvasive disease,9539-8
Cache Valley virus non-neuroinvasive disease,9540-6
Cache Valley virus non-neuroinvasive disease,9577-8
Cache Valley virus non-neuroinvasive disease,9634-7
Cache Valley virus non-neuroinvasive disease,9635-4
Cache Valley virus neuroinvasive disease,10896-9
Cache Valley virus neuroinvasive disease,10897-7
Cache Valley virus neuroinvasive disease,10898-5
Cache Valley virus neuroinvasive disease,10899-3
Cache Valley virus neuroinvasive disease,10904-1
Cache Valley virus neuroinvasive disease,10905-8
Cache Valley virus neuroinvasive disease,10906-6
Cache Valley virus neuroinvasive disease,10907-4
Cache Valley virus neuroinvasive disease,13228-2
Cache Valley virus neuroinvasive disease,13229-0
Cache Valley virus neuroinvasive disease,13230-8
Cache Valley virus neuroinvasive disease,13231-6
Cache Valley virus neuroinvasive disease,17036-5
Cache Valley virus neuroinvasive disease,17037-3
Cache Valley virus neuroinvasive disease,17038-1
Cache Valley virus neuroinvasive disease,17039-9
Cache Valley virus neuroinvasive disease,17769-1
Cache Valley virus neuroinvasive disease,17770-9
Cache Valley virus neuroinvasive disease,21509-5
Cache Valley virus neuroinvasive disease,21510-3
Cache Valley virus neuroinvasive disease,23046-6
Cache Valley virus neuroinvasive disease,23991-3
Cache Valley virus neuroinvasive disease,23992-1
Cache Valley virus neuroinvasive disease,29783-8
Cache Valley virus neuroinvasive disease,29785-3
Cache Valley virus neuroinvasive disease,29789-5
Cache Valley virus neuroinvasive disease,30174-7
Cache Valley virus neuroinvasive disease,30175-4
Cache Valley virus neuroinvasive disease,30176-2
Cache Valley virus neuroinvasive disease,30177-0
Cache Valley virus neuroinvasive disease,30179-6
Cache Valley virus neuroinvasive disease,33295-7
Cache Valley virus neuroinvasive disease,34450-7
Cache Valley virus neuroinvasive disease,37983-4
Cache Valley virus neuroinvasive disease,37984-2
Cache Valley virus neuroinvasive disease,41878-0
Cache Valley virus neuroinvasive disease,5073-2
Cache Valley virus neuroinvasive disease,5134-2
Cache Valley virus neuroinvasive disease,5406-4
Cache Valley virus neuroinvasive disease,5883-4
Cache Valley virus neuroinvasive disease,5884-2
Cache Valley virus neuroinvasive disease,5888-3
Cache Valley virus neuroinvasive disease,6309-9
Cache Valley virus neuroinvasive disease,6310-7
Cache Valley virus neuroinvasive disease,6383-4
Cache Valley virus neuroinvasive disease,6388-3
Cache Valley virus neuroinvasive disease,6389-1
Cache Valley virus neuroinvasive disease,6549-0
Cache Valley virus neuroinvasive disease,6585-4
Cache Valley virus neuroinvasive disease,6586-2
Cache Valley virus neuroinvasive disease,6812-2
Cache Valley virus neuroinvasive disease,6957-5
Cache Valley virus neuroinvasive disease,6958-3
Cache Valley virus neuroinvasive disease,7860-0
Cache Valley virus neuroinvasive disease,7861-8
Cache Valley virus neuroinvasive disease,7938-4
Cache Valley virus neuroinvasive disease,7940-0
Cache Valley virus neuroinvasive disease,7941-8
Cache Valley virus neuroinvasive disease,8016-8
Cache Valley virus neuroinvasive disease,8017-6
Cache Valley virus neuroinvasive disease,8021-8
Cache Valley virus neuroinvasive disease,8023-4
Cache Valley virus neuroinvasive disease,8025-9
Cache Valley virus neuroinvasive disease,8052-3
Cache Valley virus neuroinvasive disease,8053-1
Cache Valley virus neuroinvasive disease,9314-6
Cache Valley virus neuroinvasive disease,9315-3
Cache Valley virus neuroinvasive disease,9316-1
Cache Valley virus neuroinvasive disease,9539-8
Cache Valley virus neuroinvasive disease,9540-6
Cache Valley virus neuroinvasive disease,9577-8
Cache Valley virus neuroinvasive disease,9634-7
Cache Valley virus neuroinvasive disease,9635-4
California serogroup virus neuroinvasive disease,10896-9
California serogroup virus neuroinvasive disease,10897-7
California serogroup virus neuroinvasive disease,10898-5
California serogroup virus neuroinvasive disease,10899-3
California serogroup virus neuroinvasive disease,10904-1
California serogroup virus neuroinvasive disease,10905-8
California serogroup virus neuroinvasive disease,10906-6
California serogroup virus neuroinvasive disease,10907-4
California serogroup virus neuroinvasive disease,13228-2
California serogroup virus neuroinvasive disease,13229-0
California serogroup virus neuroinvasive disease,13230-8
California serogroup virus neuroinvasive disease,13231-6
California serogroup virus neuroinvasive disease,17036-5
California serogroup virus neuroinvasive disease,17037-3
California serogroup virus neuroinvasive disease,17038-1
California serogroup virus neuroinvasive disease,17039-9
California serogroup virus neuroinvasive disease,17769-1
California serogroup virus neuroinvasive disease,17770-9
California serogroup virus neuroinvasive disease,21509-5
California serogroup virus neuroinvasive disease,21510-3
California serogroup virus neuroinvasive disease,23046-6
California serogroup virus neuroinvasive disease,23991-3
California serogroup virus neuroinvasive disease,23992-1
California serogroup virus neuroinvasive disease,29783-8
California serogroup virus neuroinvasive disease,29785-3
California serogroup virus neuroinvasive disease,29789-5
California serogroup virus neuroinvasive disease,30174-7
California serogroup virus neuroinvasive disease,30175-4
California serogroup virus neuroinvasive disease,30176-2
California serogroup virus neuroinvasive disease,30177-0
California serogroup virus neuroinvasive disease,30179-6
California serogroup virus neuroinvasive disease,33295-7
California serogroup virus neuroinvasive disease,34450-7
California serogroup virus neuroinvasive disease,37983-4
California serogroup virus neuroinvasive disease,37984-2
California serogroup virus neuroinvasive disease,41878-0
California serogroup virus neuroinvasive disease,5073-2
California serogroup virus neuroinvasive disease,5134-2
California serogroup virus neuroinvasive disease,5406-4
California serogroup virus neuroinvasive disease,5883-4
California serogroup virus neuroinvasive disease,5884-2
California serogroup virus neuroinvasive disease,5888-3
California serogroup virus neuroinvasive disease,6309-9
California serogroup virus neuroinvasive disease,6310-7
California serogroup virus neuroinvasive disease,6383-4
California serogroup virus neuroinvasive disease,6388-3
California serogroup virus neuroinvasive disease,6389-1
California serogroup virus neuroinvasive disease,6549-0
California serogroup virus neuroinvasive disease,6585-4
California serogroup virus neuroinvasive disease,6586-2
California serogroup virus neuroinvasive disease,6812-2
California serogroup virus neuroinvasive disease,6957-5
California serogroup virus neuroinvasive disease,6958-3
California serogroup virus neuroinvasive disease,7860-0
California serogroup virus neuroinvasive disease,7861-8
California serogroup virus neuroinvasive disease,7938-4
California serogroup virus neuroinvasive disease,7940-0
California serogroup virus neuroinvasive disease,7941-8
California serogroup virus neuroinvasive disease,8016-8
California serogroup virus neuroinvasive disease,8017-6
California serogroup virus neuroinvasive disease,8021-8
California serogroup virus neuroinvasive disease,8023-4
California serogroup virus neuroinvasive disease,8025-9
California serogroup virus neuroinvasive disease,8052-3
California serogroup virus neuroinvasive disease,8053-1
California serogroup virus neuroinvasive disease,9314-6
California serogroup virus neuroinvasive disease,9315-3
California serogroup virus neuroinvasive disease,9316-1
California serogroup virus neuroinvasive disease,9539-8
California serogroup virus neuroinvasive disease,9540-6
California serogroup virus neuroinvasive disease,9577-8
California serogroup virus neuroinvasive disease,9634-7
California serogroup virus neuroinvasive disease,9635-4
California serogroup virus non-neuroinvasive disease,10896-9
California serogroup virus non-neuroinvasive disease,10897-7
California serogroup virus non-neuroinvasive disease,10898-5
California serogroup virus non-neuroinvasive disease,10899-3
California serogroup virus non-neuroinvasive disease,10904-1
California serogroup virus non-neuroinvasive disease,10905-8
California serogroup virus non-neuroinvasive disease,10906-6
California serogroup virus non-neuroinvasive disease,10907-4
California serogroup virus non-neuroinvasive disease,13228-2
California serogroup virus non-neuroinvasive disease,13229-0
California serogroup virus non-neuroinvasive disease,13230-8
California serogroup virus non-neuroinvasive disease,13231-6
California serogroup virus non-neuroinvasive disease,17036-5
California serogroup virus non-neuroinvasive disease,17037-3
California serogroup virus non-neuroinvasive disease,17038-1
California serogroup virus non-neuroinvasive disease,17039-9
California serogroup virus non-neuroinvasive disease,17769-1
California serogroup virus non-neuroinvasive disease,17770-9
California serogroup virus non-neuroinvasive disease,21509-5
California serogroup virus non-neuroinvasive disease,21510-3
California serogroup virus non-neuroinvasive disease,23046-6
California serogroup virus non-neuroinvasive disease,23991-3
California serogroup virus non-neuroinvasive disease,23992-1
California serogroup virus non-neuroinvasive disease,29783-8
California serogroup virus non-neuroinvasive disease,29785-3
California serogroup virus non-neuroinvasive disease,29789-5
California serogroup virus non-neuroinvasive disease,30174-7
California serogroup virus non-neuroinvasive disease,30175-4
California serogroup virus non-neuroinvasive disease,30176-2
California serogroup virus non-neuroinvasive disease,30177-0
California serogroup virus non-neuroinvasive disease,30179-6
California serogroup virus non-neuroinvasive disease,33295-7
California serogroup virus non-neuroinvasive disease,34450-7
California serogroup virus non-neuroinvasive disease,37983-4
California serogroup virus non-neuroinvasive disease,37984-2
California serogroup virus non-neuroinvasive disease,41878-0
California serogroup virus non-neuroinvasive disease,5073-2
California serogroup virus non-neuroinvasive disease,5134-2
California serogroup virus non-neuroinvasive disease,5406-4
California serogroup virus non-neuroinvasive disease,5883-4
California serogroup virus non-neuroinvasive disease,5884-2
California serogroup virus non-neuroinvasive disease,5888-3
California serogroup virus non-neuroinvasive disease,6309-9
California serogroup virus non-neuroinvasive disease,6310-7
California serogroup virus non-neuroinvasive disease,6383-4
California serogroup virus non-neuroinvasive disease,6388-3
California serogroup virus non-neuroinvasive disease,6389-1
California serogroup virus non-neuroinvasive disease,6549-0
California serogroup virus non-neuroinvasive disease,6585-4
California serogroup virus non-neuroinvasive disease,6586-2
California serogroup virus non-neuroinvasive disease,6812-2
California serogroup virus non-neuroinvasive disease,6957-5
California serogroup virus non-neuroinvasive disease,6958-3
California serogroup virus non-neuroinvasive disease,7860-0
California serogroup virus non-neuroinvasive disease,7861-8
California serogroup virus non-neuroinvasive disease,7938-4
California serogroup virus non-neuroinvasive disease,7940-0
California serogroup virus non-neuroinvasive disease,7941-8
California serogroup virus non-neuroinvasive disease,8016-8
California serogroup virus non-neuroinvasive disease,8017-6
California serogroup virus non-neuroinvasive disease,8021-8
California serogroup virus non-neuroinvasive disease,8023-4
California serogroup virus non-neuroinvasive disease,8025-9
California serogroup virus non-neuroinvasive disease,8052-3
California serogroup virus non-neuroinvasive disease,8053-1
California serogroup virus non-neuroinvasive disease,9314-6
California serogroup virus non-neuroinvasive disease,9315-3
California serogroup virus non-neuroinvasive disease,9316-1
California serogroup virus non-neuroinvasive disease,9539-8
California serogroup virus non-neuroinvasive disease,9540-6
California serogroup virus non-neuroinvasive disease,9577-8
California serogroup virus non-neuroinvasive disease,9634-7
California serogroup virus non-neuroinvasive disease,9635-4
CAMPYLOBACTERIOSIS,11475-1
CAMPYLOBACTERIOSIS,16528-2
CAMPYLOBACTERIOSIS,16529-0
CAMPYLOBACTERIOSIS,16531-6
CAMPYLOBACTERIOSIS,16532-4
CAMPYLOBACTERIOSIS,16534-0
CAMPYLOBACTERIOSIS,38347-1
CAMPYLOBACTERIOSIS,41852-5
CAMPYLOBACTERIOSIS,49614-1
CAMPYLOBACTERIOSIS,4992-4
CAMPYLOBACTERIOSIS,600-7
CAMPYLOBACTERIOSIS,625-4
CAMPYLOBACTERIOSIS,6329-7
CAMPYLOBACTERIOSIS,6330-5
CAMPYLOBACTERIOSIS,6331-3
CAMPYLOBACTERIOSIS,6332-1
CAMPYLOBACTERIOSIS,6333-9
CAMPYLOBACTERIOSIS,6334-7
CAMPYLOBACTERIOSIS,6335-4
CAMPYLOBACTERIOSIS,646-0
CAMPYLOBACTERIOSIS,6463-4
CHANCROID,10352-3
CHANCROID,11255-7
CHANCROID,11475-1
CHANCROID,14475-8
CHANCROID,14476-6
CHANCROID,14478-2
CHANCROID,597-5
CHANCROID,600-7
CHANCROID,634-6
CHANCROID,636-1
CHANCROID,6600-1
Chickenpox (Varicella),10734-2
Chickenpox (Varicella),10860-5
Chickenpox (Varicella),11483-5
Chickenpox (Varicella),12271-3
Chickenpox (Varicella),17766-7
Chickenpox (Varicella),21592-1
Chickenpox (Varicella),21594-7
Chickenpox (Varicella),21596-2
Chickenpox (Varicella),21597-0
Chickenpox (Varicella),21598-8
Chickenpox (Varicella),22600-1
Chickenpox (Varicella),22605-0
Chickenpox (Varicella),22606-8
Chickenpox (Varicella),26723-7
Chickenpox (Varicella),29248-2
Chickenpox (Varicella),29662-4
Chickenpox (Varicella),31694-3
Chickenpox (Varicella),31695-0
Chickenpox (Varicella),31981-4
Chickenpox (Varicella),31982-2
Chickenpox (Varicella),33327-8
Chickenpox (Varicella),35399-5
Chickenpox (Varicella),35400-1
Chickenpox (Varicella),35679-0
Chickenpox (Varicella),43588-3
Chickenpox (Varicella),43693-1
Chickenpox (Varicella),43978-6
Chickenpox (Varicella),44771-4
Chickenpox (Varicella),45063-5
Chickenpox (Varicella),47002-1
Chickenpox (Varicella),47003-9
Chickenpox (Varicella),47419-7
Chickenpox (Varicella),5401-5
Chickenpox (Varicella),5402-3
Chickenpox (Varicella),5404-9
Chickenpox (Varicella),5881-8
Chickenpox (Varicella),5882-6
Chickenpox (Varicella),6570-6
Chickenpox (Varicella),8046-5
Chickenpox (Varicella),8048-1
Chickenpox (Varicella),8049-9
Chickenpox (Varicella),9636-2
Chlamydia trachomatis infection,11475-1
Chlamydia trachomatis infection,14202-6
Chlamydia trachomatis infection,14203-4
Chlamydia trachomatis infection,14461-8
Chlamydia trachomatis infection,14462-6
Chlamydia trachomatis infection,14463-4
Chlamydia trachomatis infection,14464-2
Chlamydia trachomatis infection,14465-9
Chlamydia trachomatis infection,14466-7
Chlamydia trachomatis infection,14467-5
Chlamydia trachomatis infection,14468-3
Chlamydia trachomatis infection,14469-1
Chlamydia trachomatis infection,14470-9
Chlamydia trachomatis infection,14471-7
Chlamydia trachomatis infection,14472-5
Chlamydia trachomatis infection,14473-3
Chlamydia trachomatis infection,14474-1
Chlamydia trachomatis infection,14507-8
Chlamydia trachomatis infection,14508-6
Chlamydia trachomatis infection,14509-4
Chlamydia trachomatis infection,14510-2
Chlamydia trachomatis infection,14511-0
Chlamydia trachomatis infection,14512-8
Chlamydia trachomatis infection,14513-6
Chlamydia trachomatis infection,16589-4
Chlamydia trachomatis infection,16599-3
Chlamydia trachomatis infection,16600-9
Chlamydia trachomatis infection,16601-7
Chlamydia trachomatis infection,20993-2
Chlamydia trachomatis infection,21189-6
Chlamydia trachomatis infection,21190-4
Chlamydia trachomatis infection,21191-2
Chlamydia trachomatis infection,21613-5
Chlamydia trachomatis infection,22191-1
Chlamydia trachomatis infection,22193-7
Chlamydia trachomatis infection,35713-7
Chlamydia trachomatis infection,36902-5
Chlamydia trachomatis infection,36903-3
Chlamydia trachomatis infection,43304-5
Chlamydia trachomatis infection,43404-3
Chlamydia trachomatis infection,44079-2
Chlamydia trachomatis infection,45078-3
Chlamydia trachomatis infection,47212-6
Chlamydia trachomatis infection,4993-2
Chlamydia trachomatis infection,50387-0
Chlamydia trachomatis infection,5084-9
Chlamydia trachomatis infection,5090-6
Chlamydia trachomatis infection,560-3
Chlamydia trachomatis infection,600-7
Chlamydia trachomatis infection,6349-5
Chlamydia trachomatis infection,6350-3
Chlamydia trachomatis infection,6351-1
Chlamydia trachomatis infection,6353-7
Chlamydia trachomatis infection,6354-5
Chlamydia trachomatis infection,6355-2
Chlamydia trachomatis infection,6356-0
Chlamydia trachomatis infection,6357-8
Chlamydia trachomatis infection,6358-6
Chlamydia trachomatis infection,6918-7
Chlamydia trachomatis infection,6919-5
Chlamydia trachomatis infection,6920-3
Cholera,11475-1
Cholera,31698-4
Cholera,5405-6
Cholera,625-4
Cholera,6578-9
Cholera,6579-7
Cholera,6581-3
COCCIDIOIDOMYCOSIS,31153-0
COCCIDIOIDOMYCOSIS,31154-8
COCCIDIOIDOMYCOSIS,33510-9
COCCIDIOIDOMYCOSIS,5096-3
CRYPTOSPORIDIOSIS,10704-5
CRYPTOSPORIDIOSIS,11475-1
CRYPTOSPORIDIOSIS,20781-1
CRYPTOSPORIDIOSIS,20932-0
CRYPTOSPORIDIOSIS,27907-5
CRYPTOSPORIDIOSIS,39534-3
CRYPTOSPORIDIOSIS,566-0
CRYPTOSPORIDIOSIS,6371-9
CRYPTOSPORIDIOSIS,6372-7
CRYPTOSPORIDIOSIS,6471-7
CRYPTOSPORIDIOSIS,6674-6
CRYPTOSPORIDIOSIS,673-4
CRYPTOSPORIDIOSIS,9785-7
CYCLOSPORIASIS,10659-1
CYCLOSPORIASIS,10704-5
CYCLOSPORIASIS,10850-6
CYCLOSPORIASIS,20932-0
CYCLOSPORIASIS,673-4
CYCLOSPORIASIS,9785-7
Dengue,10896-9
Dengue,10897-7
Dengue,10898-5
Dengue,10899-3
Dengue,10904-1
Dengue,10905-8
Dengue,10906-6
Dengue,10907-4
Dengue,13228-2
Dengue,13229-0
Dengue,13230-8
Dengue,13231-6
Dengue,17036-5
Dengue,17037-3
Dengue,17038-1
Dengue,17039-9
Dengue,17769-1
Dengue,17770-9
Dengue,21509-5
Dengue,21510-3
Dengue,23046-6
Dengue,23991-3
Dengue,23992-1
Dengue,29783-8
Dengue,29785-3
Dengue,29789-5
Dengue,30174-7
Dengue,30175-4
Dengue,30176-2
Dengue,30177-0
Dengue,30179-6
Dengue,33295-7
Dengue,34450-7
Dengue,37983-4
Dengue,37984-2
Dengue,41878-0
Dengue,5073-2
Dengue,5134-2
Dengue,5406-4
Dengue,5883-4
Dengue,5884-2
Dengue,5888-3
Dengue,6309-9
Dengue,6310-7
Dengue,6383-4
Dengue,6388-3
Dengue,6389-1
Dengue,6549-0
Dengue,6585-4
Dengue,6586-2
Dengue,6812-2
Dengue,6957-5
Dengue,6958-3
Dengue,7860-0
Dengue,7861-8
Dengue,7938-4
Dengue,7940-0
Dengue,7941-8
Dengue,8016-8
Dengue,8017-6
Dengue,8021-8
Dengue,8023-4
Dengue,8025-9
Dengue,8052-3
Dengue,8053-1
Dengue,9314-6
Dengue,9315-3
Dengue,9316-1
Dengue,9539-8
Dengue,9540-6
Dengue,9577-8
Dengue,9634-7
Dengue,9635-4
Dengue Hemorrhagic Fever,10896-9
Dengue Hemorrhagic Fever,10897-7
Dengue Hemorrhagic Fever,10898-5
Dengue Hemorrhagic Fever,10899-3
Dengue Hemorrhagic Fever,10904-1
Dengue Hemorrhagic Fever,10905-8
Dengue Hemorrhagic Fever,10906-6
Dengue Hemorrhagic Fever,10907-4
Dengue Hemorrhagic Fever,13228-2
Dengue Hemorrhagic Fever,13229-0
Dengue Hemorrhagic Fever,13230-8
Dengue Hemorrhagic Fever,13231-6
Dengue Hemorrhagic Fever,17036-5
Dengue Hemorrhagic Fever,17037-3
Dengue Hemorrhagic Fever,17038-1
Dengue Hemorrhagic Fever,17039-9
Dengue Hemorrhagic Fever,17769-1
Dengue Hemorrhagic Fever,17770-9
Dengue Hemorrhagic Fever,21509-5
Dengue Hemorrhagic Fever,21510-3
Dengue Hemorrhagic Fever,23046-6
Dengue Hemorrhagic Fever,23991-3
Dengue Hemorrhagic Fever,23992-1
Dengue Hemorrhagic Fever,29783-8
Dengue Hemorrhagic Fever,29785-3
Dengue Hemorrhagic Fever,29789-5
Dengue Hemorrhagic Fever,30174-7
Dengue Hemorrhagic Fever,30175-4
Dengue Hemorrhagic Fever,30176-2
Dengue Hemorrhagic Fever,30177-0
Dengue Hemorrhagic Fever,30179-6
Dengue Hemorrhagic Fever,33295-7
Dengue Hemorrhagic Fever,34450-7
Dengue Hemorrhagic Fever,37983-4
Dengue Hemorrhagic Fever,37984-2
Dengue Hemorrhagic Fever,41878-0
Dengue Hemorrhagic Fever,5073-2
Dengue Hemorrhagic Fever,5134-2
Dengue Hemorrhagic Fever,5406-4
Dengue Hemorrhagic Fever,5883-4
Dengue Hemorrhagic Fever,5884-2
Dengue Hemorrhagic Fever,5888-3
Dengue Hemorrhagic Fever,6309-9
Dengue Hemorrhagic Fever,6310-7
Dengue Hemorrhagic Fever,6383-4
Dengue Hemorrhagic Fever,6388-3
Dengue Hemorrhagic Fever,6389-1
Dengue Hemorrhagic Fever,6549-0
Dengue Hemorrhagic Fever,6585-4
Dengue Hemorrhagic Fever,6586-2
Dengue Hemorrhagic Fever,6812-2
Dengue Hemorrhagic Fever,6957-5
Dengue Hemorrhagic Fever,6958-3
Dengue Hemorrhagic Fever,7860-0
Dengue Hemorrhagic Fever,7861-8
Dengue Hemorrhagic Fever,7938-4
Dengue Hemorrhagic Fever,7940-0
Dengue Hemorrhagic Fever,7941-8
Dengue Hemorrhagic Fever,8016-8
Dengue Hemorrhagic Fever,8017-6
Dengue Hemorrhagic Fever,8021-8
Dengue Hemorrhagic Fever,8023-4
Dengue Hemorrhagic Fever,8025-9
Dengue Hemorrhagic Fever,8052-3
Dengue Hemorrhagic Fever,8053-1
Dengue Hemorrhagic Fever,9314-6
Dengue Hemorrhagic Fever,9315-3
Dengue Hemorrhagic Fever,9316-1
Dengue Hemorrhagic Fever,9539-8
Dengue Hemorrhagic Fever,9540-6
Dengue Hemorrhagic Fever,9577-8
Dengue Hemorrhagic Fever,9634-7
Dengue Hemorrhagic Fever,9635-4
DIPHTHERIA,10353-1
DIPHTHERIA,11475-1
DIPHTHERIA,14479-0
DIPHTHERIA,14480-8
DIPHTHERIA,14481-6
DIPHTHERIA,14483-2
DIPHTHERIA,16676-9
DIPHTHERIA,567-8
DIPHTHERIA,597-5
DIPHTHERIA,600-7
DIPHTHERIA,604-9
DIPHTHERIA,605-6
DIPHTHERIA,622-1
DIPHTHERIA,623-9
DIPHTHERIA,624-7
DIPHTHERIA,626-2
DIPHTHERIA,632-0
DIPHTHERIA,634-6
DIPHTHERIA,636-1
DIPHTHERIA,6460-0
DIPHTHERIA,6462-6
DIPHTHERIA,6463-4
DIPHTHERIA,6596-1
Eastern Equine encephalitis virus neuroinvasive disease,10896-9
Eastern Equine encephalitis virus neuroinvasive disease,10897-7
Eastern Equine encephalitis virus neuroinvasive disease,10898-5
Eastern Equine encephalitis virus neuroinvasive disease,10899-3
Eastern Equine encephalitis virus neuroinvasive disease,10904-1
Eastern Equine encephalitis virus neuroinvasive disease,10905-8
Eastern Equine encephalitis virus neuroinvasive disease,10906-6
Eastern Equine encephalitis virus neuroinvasive disease,10907-4
Eastern Equine encephalitis virus neuroinvasive disease,13228-2
Eastern Equine encephalitis virus neuroinvasive disease,13229-0
Eastern Equine encephalitis virus neuroinvasive disease,13230-8
Eastern Equine encephalitis virus neuroinvasive disease,13231-6
Eastern Equine encephalitis virus neuroinvasive disease,17036-5
Eastern Equine encephalitis virus neuroinvasive disease,17037-3
Eastern Equine encephalitis virus neuroinvasive disease,17038-1
Eastern Equine encephalitis virus neuroinvasive disease,17039-9
Eastern Equine encephalitis virus neuroinvasive disease,17769-1
Eastern Equine encephalitis virus neuroinvasive disease,17770-9
Eastern Equine encephalitis virus neuroinvasive disease,21509-5
Eastern Equine encephalitis virus neuroinvasive disease,21510-3
Eastern Equine encephalitis virus neuroinvasive disease,23046-6
Eastern Equine encephalitis virus neuroinvasive disease,23991-3
Eastern Equine encephalitis virus neuroinvasive disease,23992-1
Eastern Equine encephalitis virus neuroinvasive disease,29783-8
Eastern Equine encephalitis virus neuroinvasive disease,29785-3
Eastern Equine encephalitis virus neuroinvasive disease,29789-5
Eastern Equine encephalitis virus neuroinvasive disease,30174-7
Eastern Equine encephalitis virus neuroinvasive disease,30175-4
Eastern Equine encephalitis virus neuroinvasive disease,30176-2
Eastern Equine encephalitis virus neuroinvasive disease,30177-0
Eastern Equine encephalitis virus neuroinvasive disease,30179-6
Eastern Equine encephalitis virus neuroinvasive disease,33295-7
Eastern Equine encephalitis virus neuroinvasive disease,34450-7
Eastern Equine encephalitis virus neuroinvasive disease,37983-4
Eastern Equine encephalitis virus neuroinvasive disease,37984-2
Eastern Equine encephalitis virus neuroinvasive disease,41878-0
Eastern Equine encephalitis virus neuroinvasive disease,5073-2
Eastern Equine encephalitis virus neuroinvasive disease,5134-2
Eastern Equine encephalitis virus neuroinvasive disease,5406-4
Eastern Equine encephalitis virus neuroinvasive disease,5883-4
Eastern Equine encephalitis virus neuroinvasive disease,5884-2
Eastern Equine encephalitis virus neuroinvasive disease,5888-3
Eastern Equine encephalitis virus neuroinvasive disease,6309-9
Eastern Equine encephalitis virus neuroinvasive disease,6310-7
Eastern Equine encephalitis virus neuroinvasive disease,6383-4
Eastern Equine encephalitis virus neuroinvasive disease,6388-3
Eastern Equine encephalitis virus neuroinvasive disease,6389-1
Eastern Equine encephalitis virus neuroinvasive disease,6549-0
Eastern Equine encephalitis virus neuroinvasive disease,6585-4
Eastern Equine encephalitis virus neuroinvasive disease,6586-2
Eastern Equine encephalitis virus neuroinvasive disease,6812-2
Eastern Equine encephalitis virus neuroinvasive disease,6957-5
Eastern Equine encephalitis virus neuroinvasive disease,6958-3
Eastern Equine encephalitis virus neuroinvasive disease,7860-0
Eastern Equine encephalitis virus neuroinvasive disease,7861-8
Eastern Equine encephalitis virus neuroinvasive disease,7938-4
Eastern Equine encephalitis virus neuroinvasive disease,7940-0
Eastern Equine encephalitis virus neuroinvasive disease,7941-8
Eastern Equine encephalitis virus neuroinvasive disease,8016-8
Eastern Equine encephalitis virus neuroinvasive disease,8017-6
Eastern Equine encephalitis virus neuroinvasive disease,8021-8
Eastern Equine encephalitis virus neuroinvasive disease,8023-4
Eastern Equine encephalitis virus neuroinvasive disease,8025-9
Eastern Equine encephalitis virus neuroinvasive disease,8052-3
Eastern Equine encephalitis virus neuroinvasive disease,8053-1
Eastern Equine encephalitis virus neuroinvasive disease,9314-6
Eastern Equine encephalitis virus neuroinvasive disease,9315-3
Eastern Equine encephalitis virus neuroinvasive disease,9316-1
Eastern Equine encephalitis virus neuroinvasive disease,9539-8
Eastern Equine encephalitis virus neuroinvasive disease,9540-6
Eastern Equine encephalitis virus neuroinvasive disease,9577-8
Eastern Equine encephalitis virus neuroinvasive disease,9634-7
Eastern Equine encephalitis virus neuroinvasive disease,9635-4
Eastern Equine encephalitis virus non-neuroinvasive disease,10896-9
Eastern Equine encephalitis virus non-neuroinvasive disease,10897-7
Eastern Equine encephalitis virus non-neuroinvasive disease,10898-5
Eastern Equine encephalitis virus non-neuroinvasive disease,10899-3
Eastern Equine encephalitis virus non-neuroinvasive disease,10904-1
Eastern Equine encephalitis virus non-neuroinvasive disease,10905-8
Eastern Equine encephalitis virus non-neuroinvasive disease,10906-6
Eastern Equine encephalitis virus non-neuroinvasive disease,10907-4
Eastern Equine encephalitis virus non-neuroinvasive disease,13228-2
Eastern Equine encephalitis virus non-neuroinvasive disease,13229-0
Eastern Equine encephalitis virus non-neuroinvasive disease,13230-8
Eastern Equine encephalitis virus non-neuroinvasive disease,13231-6
Eastern Equine encephalitis virus non-neuroinvasive disease,17036-5
Eastern Equine encephalitis virus non-neuroinvasive disease,17037-3
Eastern Equine encephalitis virus non-neuroinvasive disease,17038-1
Eastern Equine encephalitis virus non-neuroinvasive disease,17039-9
Eastern Equine encephalitis virus non-neuroinvasive disease,17769-1
Eastern Equine encephalitis virus non-neuroinvasive disease,17770-9
Eastern Equine encephalitis virus non-neuroinvasive disease,21509-5
Eastern Equine encephalitis virus non-neuroinvasive disease,21510-3
Eastern Equine encephalitis virus non-neuroinvasive disease,23046-6
Eastern Equine encephalitis virus non-neuroinvasive disease,23991-3
Eastern Equine encephalitis virus non-neuroinvasive disease,23992-1
Eastern Equine encephalitis virus non-neuroinvasive disease,29783-8
Eastern Equine encephalitis virus non-neuroinvasive disease,29785-3
Eastern Equine encephalitis virus non-neuroinvasive disease,29789-5
Eastern Equine encephalitis virus non-neuroinvasive disease,30174-7
Eastern Equine encephalitis virus non-neuroinvasive disease,30175-4
Eastern Equine encephalitis virus non-neuroinvasive disease,30176-2
Eastern Equine encephalitis virus non-neuroinvasive disease,30177-0
Eastern Equine encephalitis virus non-neuroinvasive disease,30179-6
Eastern Equine encephalitis virus non-neuroinvasive disease,33295-7
Eastern Equine encephalitis virus non-neuroinvasive disease,34450-7
Eastern Equine encephalitis virus non-neuroinvasive disease,37983-4
Eastern Equine encephalitis virus non-neuroinvasive disease,37984-2
Eastern Equine encephalitis virus non-neuroinvasive disease,41878-0
Eastern Equine encephalitis virus non-neuroinvasive disease,5073-2
Eastern Equine encephalitis virus non-neuroinvasive disease,5134-2
Eastern Equine encephalitis virus non-neuroinvasive disease,5406-4
Eastern Equine encephalitis virus non-neuroinvasive disease,5883-4
Eastern Equine encephalitis virus non-neuroinvasive disease,5884-2
Eastern Equine encephalitis virus non-neuroinvasive disease,5888-3
Eastern Equine encephalitis virus non-neuroinvasive disease,6309-9
Eastern Equine encephalitis virus non-neuroinvasive disease,6310-7
Eastern Equine encephalitis virus non-neuroinvasive disease,6383-4
Eastern Equine encephalitis virus non-neuroinvasive disease,6388-3
Eastern Equine encephalitis virus non-neuroinvasive disease,6389-1
Eastern Equine encephalitis virus non-neuroinvasive disease,6549-0
Eastern Equine encephalitis virus non-neuroinvasive disease,6585-4
Eastern Equine encephalitis virus non-neuroinvasive disease,6586-2
Eastern Equine encephalitis virus non-neuroinvasive disease,6812-2
Eastern Equine encephalitis virus non-neuroinvasive disease,6957-5
Eastern Equine encephalitis virus non-neuroinvasive disease,6958-3
Eastern Equine encephalitis virus non-neuroinvasive disease,7860-0
Eastern Equine encephalitis virus non-neuroinvasive disease,7861-8
Eastern Equine encephalitis virus non-neuroinvasive disease,7938-4
Eastern Equine encephalitis virus non-neuroinvasive disease,7940-0
Eastern Equine encephalitis virus non-neuroinvasive disease,7941-8
Eastern Equine encephalitis virus non-neuroinvasive disease,8016-8
Eastern Equine encephalitis virus non-neuroinvasive disease,8017-6
Eastern Equine encephalitis virus non-neuroinvasive disease,8021-8
Eastern Equine encephalitis virus non-neuroinvasive disease,8023-4
Eastern Equine encephalitis virus non-neuroinvasive disease,8025-9
Eastern Equine encephalitis virus non-neuroinvasive disease,8052-3
Eastern Equine encephalitis virus non-neuroinvasive disease,8053-1
Eastern Equine encephalitis virus non-neuroinvasive disease,9314-6
Eastern Equine encephalitis virus non-neuroinvasive disease,9315-3
Eastern Equine encephalitis virus non-neuroinvasive disease,9316-1
Eastern Equine encephalitis virus non-neuroinvasive disease,9539-8
Eastern Equine encephalitis virus non-neuroinvasive disease,9540-6
Eastern Equine encephalitis virus non-neuroinvasive disease,9577-8
Eastern Equine encephalitis virus non-neuroinvasive disease,9634-7
Eastern Equine encephalitis virus non-neuroinvasive disease,9635-4
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,13195-3
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,16808-8
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,16809-6
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,22283-6
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,23877-4
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,23878-2
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,24042-4
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,27994-3
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,29560-0
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,29793-7
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,29794-5
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,33581-0
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,47405-6
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,6401-4
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,6402-2
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,6403-0
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,6404-8
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,7875-8
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,7876-6
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,7877-4
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,7878-2
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,9783-2
Ehrlichia chaffeensis- Human Monocytic Ehrlichiosis,9784-0
Ehrlichia ewingii,13195-3
Ehrlichia ewingii,16808-8
Ehrlichia ewingii,16809-6
Ehrlichia ewingii,22283-6
Ehrlichia ewingii,23877-4
Ehrlichia ewingii,23878-2
Ehrlichia ewingii,24042-4
Ehrlichia ewingii,27994-3
Ehrlichia ewingii,29560-0
Ehrlichia ewingii,29793-7
Ehrlichia ewingii,29794-5
Ehrlichia ewingii,33581-0
Ehrlichia ewingii,47405-6
Ehrlichia ewingii,6401-4
Ehrlichia ewingii,6402-2
Ehrlichia ewingii,6403-0
Ehrlichia ewingii,6404-8
Ehrlichia ewingii,7875-8
Ehrlichia ewingii,7876-6
Ehrlichia ewingii,7877-4
Ehrlichia ewingii,7878-2
Ehrlichia ewingii,9783-2
Ehrlichia ewingii,9784-0
"Ehrlichiosis/Anaplasmosis, undetermined",13195-3
"Ehrlichiosis/Anaplasmosis, undetermined",16808-8
"Ehrlichiosis/Anaplasmosis, undetermined",16809-6
"Ehrlichiosis/Anaplasmosis, undetermined",22283-6
"Ehrlichiosis/Anaplasmosis, undetermined",23877-4
"Ehrlichiosis/Anaplasmosis, undetermined",23878-2
"Ehrlichiosis/Anaplasmosis, undetermined",24042-4
"Ehrlichiosis/Anaplasmosis, undetermined",27994-3
"Ehrlichiosis/Anaplasmosis, undetermined",29560-0
"Ehrlichiosis/Anaplasmosis, undetermined",29793-7
"Ehrlichiosis/Anaplasmosis, undetermined",29794-5
"Ehrlichiosis/Anaplasmosis, undetermined",33581-0
"Ehrlichiosis/Anaplasmosis, undetermined",47405-6
"Ehrlichiosis/Anaplasmosis, undetermined",6401-4
"Ehrlichiosis/Anaplasmosis, undetermined",6402-2
"Ehrlichiosis/Anaplasmosis, undetermined",6403-0
"Ehrlichiosis/Anaplasmosis, undetermined",6404-8
"Ehrlichiosis/Anaplasmosis, undetermined",7875-8
"Ehrlichiosis/Anaplasmosis, undetermined",7876-6
"Ehrlichiosis/Anaplasmosis, undetermined",7877-4
"Ehrlichiosis/Anaplasmosis, undetermined",7878-2
"Ehrlichiosis/Anaplasmosis, undetermined",9783-2
"Ehrlichiosis/Anaplasmosis, undetermined",9784-0
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",13195-3
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",16808-8
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",16809-6
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",22283-6
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",23877-4
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",23878-2
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",24042-4
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",27994-3
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",29560-0
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",29793-7
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",29794-5
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",33581-0
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",47405-6
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",6401-4
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",6402-2
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",6403-0
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",6404-8
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",7875-8
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",7876-6
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",7877-4
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",7878-2
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",9783-2
"Anaplasma phagocytophilum- Human Granulocytic Anaplasmosis, formerly Human Granulocytic Ehrlichiosis",9784-0
"Encephalitis, post-chickenpox",10896-9
"Encephalitis, post-chickenpox",10897-7
"Encephalitis, post-chickenpox",10898-5
"Encephalitis, post-chickenpox",10899-3
"Encephalitis, post-chickenpox",10904-1
"Encephalitis, post-chickenpox",10905-8
"Encephalitis, post-chickenpox",17036-5
"Encephalitis, post-chickenpox",17037-3
"Encephalitis, post-chickenpox",17038-1
"Encephalitis, post-chickenpox",17039-9
"Encephalitis, post-chickenpox",29789-5
"Encephalitis, post-chickenpox",30174-7
"Encephalitis, post-chickenpox",30175-4
"Encephalitis, post-chickenpox",30176-2
"Encephalitis, post-chickenpox",33295-7
"Encephalitis, post-chickenpox",5073-2
"Encephalitis, post-chickenpox",5883-4
"Encephalitis, post-chickenpox",5884-2
"Encephalitis, post-chickenpox",5888-3
"Encephalitis, post-chickenpox",6309-9
"Encephalitis, post-chickenpox",6310-7
"Encephalitis, post-chickenpox",7938-4
"Encephalitis, post-chickenpox",7940-0
"Encephalitis, post-chickenpox",7941-8
"Encephalitis, post-chickenpox",9539-8
"Encephalitis, post-chickenpox",9540-6
"Encephalitis, post-mumps",10896-9
"Encephalitis, post-mumps",10897-7
"Encephalitis, post-mumps",10898-5
"Encephalitis, post-mumps",10899-3
"Encephalitis, post-mumps",10904-1
"Encephalitis, post-mumps",10905-8
"Encephalitis, post-mumps",17036-5
"Encephalitis, post-mumps",17037-3
"Encephalitis, post-mumps",17038-1
"Encephalitis, post-mumps",17039-9
"Encephalitis, post-mumps",29789-5
"Encephalitis, post-mumps",30174-7
"Encephalitis, post-mumps",30175-4
"Encephalitis, post-mumps",30176-2
"Encephalitis, post-mumps",33295-7
"Encephalitis, post-mumps",5073-2
"Encephalitis, post-mumps",5883-4
"Encephalitis, post-mumps",5884-2
"Encephalitis, post-mumps",5888-3
"Encephalitis, post-mumps",6309-9
"Encephalitis, post-mumps",6310-7
"Encephalitis, post-mumps",7938-4
"Encephalitis, post-mumps",7940-0
"Encephalitis, post-mumps",7941-8
"Encephalitis, post-mumps",9539-8
"Encephalitis, post-mumps",9540-6
"Encephalitis, post-other",10896-9
"Encephalitis, post-other",10897-7
"Encephalitis, post-other",10898-5
"Encephalitis, post-other",10899-3
"Encephalitis, post-other",10904-1
"Encephalitis, post-other",10905-8
"Encephalitis, post-other",17036-5
"Encephalitis, post-other",17037-3
"Encephalitis, post-other",17038-1
"Encephalitis, post-other",17039-9
"Encephalitis, post-other",29789-5
"Encephalitis, post-other",30174-7
"Encephalitis, post-other",30175-4
"Encephalitis, post-other",30176-2
"Encephalitis, post-other",33295-7
"Encephalitis, post-other",5073-2
"Encephalitis, post-other",5883-4
"Encephalitis, post-other",5884-2
"Encephalitis, post-other",5888-3
"Encephalitis, post-other",6309-9
"Encephalitis, post-other",6310-7
"Encephalitis, post-other",7938-4
"Encephalitis, post-other",7940-0
"Encephalitis, post-other",7941-8
"Encephalitis, post-other",9539-8
"Encephalitis, post-other",9540-6
GIARDIASIS,10356-4
GIARDIASIS,10670-8
GIARDIASIS,10701-1
GIARDIASIS,10702-9
GIARDIASIS,10703-7
GIARDIASIS,10704-5
GIARDIASIS,11475-1
GIARDIASIS,14210-9
GIARDIASIS,16898-9
GIARDIASIS,16899-7
GIARDIASIS,18307-9
GIARDIASIS,18493-7
GIARDIASIS,18494-5
GIARDIASIS,18495-2
GIARDIASIS,18496-0
GIARDIASIS,20931-2
GIARDIASIS,20932-0
GIARDIASIS,27265-8
GIARDIASIS,5169-8
GIARDIASIS,6412-1
GIARDIASIS,6413-9
GIARDIASIS,6470-9
GIARDIASIS,673-4
GIARDIASIS,9785-7
GONORRHEA,10352-3
GONORRHEA,10354-9
GONORRHEA,11475-1
GONORRHEA,14127-5
GONORRHEA,14475-8
GONORRHEA,14476-6
GONORRHEA,14477-4
GONORRHEA,14478-2
GONORRHEA,17898-8
GONORRHEA,21414-8
GONORRHEA,21415-5
GONORRHEA,21416-3
GONORRHEA,23908-7
GONORRHEA,24111-7
GONORRHEA,31906-1
GONORRHEA,31910-3
GONORRHEA,32198-4
GONORRHEA,32705-6
GONORRHEA,36902-5
GONORRHEA,36903-3
GONORRHEA,43305-2
GONORRHEA,43403-5
GONORRHEA,47387-6
GONORRHEA,5028-6
GONORRHEA,50388-8
GONORRHEA,600-7
GONORRHEA,605-6
GONORRHEA,609-8
GONORRHEA,620-5
GONORRHEA,621-3
GONORRHEA,626-2
GONORRHEA,630-4
GONORRHEA,6463-4
GONORRHEA,6487-3
GONORRHEA,6488-1
GONORRHEA,6489-9
GONORRHEA,6490-7
GONORRHEA,6491-5
GONORRHEA,688-2
GONORRHEA,690-8
GONORRHEA,691-6
GONORRHEA,692-4
GONORRHEA,693-2
GONORRHEA,694-0
GONORRHEA,695-7
GONORRHEA,696-5
GONORRHEA,697-3
GONORRHEA,698-1
GONORRHEA,9568-7
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",11475-1
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",14321-4
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",16926-8
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",32139-8
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",597-5
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",600-7
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",606-4
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",609-8
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",610-6
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",611-4
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",634-6
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",636-1
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6463-4
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6600-1
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6610-0
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6611-8
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6612-6
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6613-4
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6614-2
"HAEMOPHILUS INFLUENZAE, INVASIVE DISEASE",6615-9
Hantavirus pulmonary syndrome,23867-5
Hantavirus pulmonary syndrome,23868-3
Hantavirus pulmonary syndrome,26654-4
Hantavirus pulmonary syndrome,35393-8
Hantavirus pulmonary syndrome,7898-0
Hantavirus pulmonary syndrome,7899-8
Hantavirus infection,23867-5
Hantavirus infection,23868-3
Hantavirus infection,26654-4
Hantavirus infection,35393-8
Hantavirus infection,7898-0
Hantavirus infection,7899-8
"Hepatitis A",13950-1
"Hepatitis A",13951-9
"Hepatitis A",22312-3
"Hepatitis A",22313-1
"Hepatitis A",22314-9
"Hepatitis A",5181-3
"Hepatitis A",5182-1
"Hepatitis A",5183-9
"Hepatitis B virus infection, chronic",10673-2
"Hepatitis B virus infection, chronic",10674-0
"Hepatitis B virus infection, chronic",10675-7
"Hepatitis B virus infection, chronic",10900-9
"Hepatitis B virus infection, chronic",11258-1
"Hepatitis B virus infection, chronic",13952-7
"Hepatitis B virus infection, chronic",13953-5
"Hepatitis B virus infection, chronic",13954-3
"Hepatitis B virus infection, chronic",20442-0
"Hepatitis B virus infection, chronic",21006-2
"Hepatitis B virus infection, chronic",23869-1
"Hepatitis B virus infection, chronic",24113-3
"Hepatitis B virus infection, chronic",29610-3
"Hepatitis B virus infection, chronic",29615-2
"Hepatitis B virus infection, chronic",31204-1
"Hepatitis B virus infection, chronic",31844-4
"Hepatitis B virus infection, chronic",32366-7
"Hepatitis B virus infection, chronic",33463-1
"Hepatitis B virus infection, chronic",33633-9
"Hepatitis B virus infection, chronic",42595-9
"Hepatitis B virus infection, chronic",5007-0
"Hepatitis B virus infection, chronic",5185-4
"Hepatitis B virus infection, chronic",5186-2
"Hepatitis B virus infection, chronic",5187-0
"Hepatitis B virus infection, chronic",5189-6
"Hepatitis B virus infection, chronic",5191-2
"Hepatitis B virus infection, chronic",5193-8
"Hepatitis B virus infection, chronic",5194-6
"Hepatitis B virus infection, chronic",5195-3
"Hepatitis B virus infection, chronic",5196-1
"Hepatitis B virus infection, chronic",5197-9
"Hepatitis B virus infection, chronic",7905-3
"Hepatitis B, acute",10673-2
"Hepatitis B, acute",10674-0
"Hepatitis B, acute",10675-7
"Hepatitis B, acute",10900-9
"Hepatitis B, acute",11258-1
"Hepatitis B, acute",13952-7
"Hepatitis B, acute",13953-5
"Hepatitis B, acute",13954-3
"Hepatitis B, acute",20442-0
"Hepatitis B, acute",21006-2
"Hepatitis B, acute",23869-1
"Hepatitis B, acute",24113-3
"Hepatitis B, acute",29610-3
"Hepatitis B, acute",29615-2
"Hepatitis B, acute",31204-1
"Hepatitis B, acute",31844-4
"Hepatitis B, acute",32366-7
"Hepatitis B, acute",33463-1
"Hepatitis B, acute",33633-9
"Hepatitis B, acute",42595-9
"Hepatitis B, acute",5007-0
"Hepatitis B, acute",5185-4
"Hepatitis B, acute",5186-2
"Hepatitis B, acute",5187-0
"Hepatitis B, acute",5189-6
"Hepatitis B, acute",5191-2
"Hepatitis B, acute",5193-8
"Hepatitis B, acute",5194-6
"Hepatitis B, acute",5195-3
"Hepatitis B, acute",5196-1
"Hepatitis B, acute",5197-9
"Hepatitis B, acute",7905-3
"Hepatitis B virus infection, perinatal",10673-2
"Hepatitis B virus infection, perinatal",10674-0
"Hepatitis B virus infection, perinatal",10675-7
"Hepatitis B virus infection, perinatal",10900-9
"Hepatitis B virus infection, perinatal",11258-1
"Hepatitis B virus infection, perinatal",13952-7
"Hepatitis B virus infection, perinatal",13953-5
"Hepatitis B virus infection, perinatal",13954-3
"Hepatitis B virus infection, perinatal",20442-0
"Hepatitis B virus infection, perinatal",21006-2
"Hepatitis B virus infection, perinatal",23869-1
"Hepatitis B virus infection, perinatal",24113-3
"Hepatitis B virus infection, perinatal",29610-3
"Hepatitis B virus infection, perinatal",29615-2
"Hepatitis B virus infection, perinatal",31204-1
"Hepatitis B virus infection, perinatal",31844-4
"Hepatitis B virus infection, perinatal",32366-7
"Hepatitis B virus infection, perinatal",33463-1
"Hepatitis B virus infection, perinatal",33633-9
"Hepatitis B virus infection, perinatal",42595-9
"Hepatitis B virus infection, perinatal",5007-0
"Hepatitis B virus infection, perinatal",5185-4
"Hepatitis B virus infection, perinatal",5186-2
"Hepatitis B virus infection, perinatal",5187-0
"Hepatitis B virus infection, perinatal",5189-6
"Hepatitis B virus infection, perinatal",5191-2
"Hepatitis B virus infection, perinatal",5193-8
"Hepatitis B virus infection, perinatal",5194-6
"Hepatitis B virus infection, perinatal",5195-3
"Hepatitis B virus infection, perinatal",5196-1
"Hepatitis B virus infection, perinatal",5197-9
"Hepatitis B virus infection, perinatal",7905-3
"Hepatitis C virus infection, past or present",10676-5
"Hepatitis C virus infection, past or present",11011-4
"Hepatitis C virus infection, past or present",11076-7
"Hepatitis C virus infection, past or present",11077-5
"Hepatitis C virus infection, past or present",11259-9
"Hepatitis C virus infection, past or present",13125-0
"Hepatitis C virus infection, past or present",13955-0
"Hepatitis C virus infection, past or present",16128-1
"Hepatitis C virus infection, past or present",16129-9
"Hepatitis C virus infection, past or present",16936-7
"Hepatitis C virus infection, past or present",20416-4
"Hepatitis C virus infection, past or present",22327-1
"Hepatitis C virus infection, past or present",23870-9
"Hepatitis C virus infection, past or present",23871-7
"Hepatitis C virus infection, past or present",24011-9
"Hepatitis C virus infection, past or present",29609-5
"Hepatitis C virus infection, past or present",32286-7
"Hepatitis C virus infection, past or present",38180-6
"Hepatitis C virus infection, past or present",42617-1
"Hepatitis C virus infection, past or present",48159-8
"Hepatitis C virus infection, past or present",5010-4
"Hepatitis C virus infection, past or present",5011-2
"Hepatitis C virus infection, past or present",5012-0
"Hepatitis C virus infection, past or present",5198-7
"Hepatitis C virus infection, past or present",5199-5
"Hepatitis C virus infection, past or present",6422-0
"Hepatitis C virus infection, past or present",9608-1
"Hepatitis C virus infection, past or present",9609-9
"Hepatitis C virus infection, past or present",9610-7
"Hepatitis C, acute",10676-5
"Hepatitis C, acute",11011-4
"Hepatitis C, acute",11076-7
"Hepatitis C, acute",11077-5
"Hepatitis C, acute",11259-9
"Hepatitis C, acute",13125-0
"Hepatitis C, acute",13955-0
"Hepatitis C, acute",16128-1
"Hepatitis C, acute",16129-9
"Hepatitis C, acute",16936-7
"Hepatitis C, acute",20416-4
"Hepatitis C, acute",22327-1
"Hepatitis C, acute",23870-9
"Hepatitis C, acute",23871-7
"Hepatitis C, acute",24011-9
"Hepatitis C, acute",29609-5
"Hepatitis C, acute",32286-7
"Hepatitis C, acute",38180-6
"Hepatitis C, acute",42617-1
"Hepatitis C, acute",48159-8
"Hepatitis C, acute",5010-4
"Hepatitis C, acute",5011-2
"Hepatitis C, acute",5012-0
"Hepatitis C, acute",5198-7
"Hepatitis C, acute",5199-5
"Hepatitis C, acute",6422-0
"Hepatitis C, acute",9608-1
"Hepatitis C, acute",9609-9
"Hepatitis C, acute",9610-7
"Hepatitis E, acute",13248-0
"Hepatitis E, acute",14211-7
"Hepatitis E, acute",14212-5
"Hepatitis E, acute",9526-5
"Hepatitis, viral other",13248-0
"Hepatitis, viral other",14211-7
"Hepatitis, viral other",14212-5
"Hepatitis, viral other",9526-5
"Hepatitis Delta co- or super-infection, acute (Hepatitis D)",13248-0
"Hepatitis Delta co- or super-infection, acute (Hepatitis D)",14211-7
"Hepatitis Delta co- or super-infection, acute (Hepatitis D)",14212-5
"Hepatitis Delta co- or super-infection, acute (Hepatitis D)",9526-5
"Influenza A, Novel Virus",17012-6
"Influenza A, Novel Virus",17014-2
"Influenza A, Novel Virus",17015-9
"Influenza A, Novel Virus",17016-7
"Influenza A, Novel Virus",22365-1
"Influenza A, Novel Virus",22367-7
"Influenza A, Novel Virus",24015-0
"Influenza A, Novel Virus",31437-7
"Influenza A, Novel Virus",31438-5
"Influenza A, Novel Virus",31858-4
"Influenza A, Novel Virus",31859-2
"Influenza A, Novel Virus",31863-4
"Influenza A, Novel Virus",31864-2
"Influenza A, Novel Virus",34153-7
"Influenza A, Novel Virus",34154-5
"Influenza A, Novel Virus",34487-9
"Influenza A, Novel Virus",38347-1
"Influenza A, Novel Virus",38382-8
"Influenza A, Novel Virus",39102-9
"Influenza A, Novel Virus",39103-7
"Influenza A, Novel Virus",40982-1
"Influenza A, Novel Virus",48310-7
"Influenza A, Novel Virus",48509-4
"Influenza A, Novel Virus",5229-0
"Influenza A, Novel Virus",5230-8
"Influenza A, Novel Virus",5860-2
"Influenza A, Novel Virus",5861-0
"Influenza A, Novel Virus",5862-8
"Influenza A, Novel Virus",5863-6
"Influenza A, Novel Virus",5864-4
"Influenza A, Novel Virus",5865-1
"Influenza A, Novel Virus",5866-9
"Influenza A, Novel Virus",5867-7
"Influenza A, Novel Virus",610-6
"Influenza A, Novel Virus",6437-8
"Influenza A, Novel Virus",6438-6
"Influenza A, Novel Virus",6584-7
"Influenza A, Novel Virus",6601-9
"Influenza A, Novel Virus",6602-7
"Influenza A, Novel Virus",6603-5
"Influenza A, Novel Virus",6604-3
"Influenza A, Novel Virus",6634-0
"Influenza A, Novel Virus",6635-7
"Influenza A, Novel Virus",6636-5
"Influenza A, Novel Virus",6637-3
"Influenza A, Novel Virus",6638-1
"Influenza A, Novel Virus",6639-9
"Influenza A, Novel Virus",6640-7
"Influenza A, Novel Virus",6641-5
"Influenza A, Novel Virus",6642-3
"Influenza A, Novel Virus",7920-2
"Influenza A, Novel Virus",7921-0
"Influenza A, Novel Virus",7922-8
"Influenza A, Novel Virus",7923-6
"Influenza A, Novel Virus",7924-4
"Influenza A, Novel Virus",7925-1
"Influenza A, Novel Virus",7926-9
"Influenza A, Novel Virus",7927-7
"Influenza A, Novel Virus",7928-5
"Influenza A, Novel Virus",7929-3
"Influenza A, Novel Virus",7931-9
"Influenza A, Novel Virus",9531-5
"Influenza A, Novel Virus",9532-3
"Influenza A, Novel Virus",9533-1
"Influenza A, Novel Virus",9534-9
"Influenza A, Novel Virus",9535-6
"Influenza A, Novel Virus",9536-4
"Influenza activity",17012-6
"Influenza activity",17014-2
"Influenza activity",17015-9
"Influenza activity",17016-7
"Influenza activity",22365-1
"Influenza activity",22367-7
"Influenza activity",24015-0
"Influenza activity",31437-7
"Influenza activity",31438-5
"Influenza activity",31858-4
"Influenza activity",31859-2
"Influenza activity",31863-4
"Influenza activity",31864-2
"Influenza activity",34153-7
"Influenza activity",34154-5
"Influenza activity",34487-9
"Influenza activity",38347-1
"Influenza activity",38382-8
"Influenza activity",39102-9
"Influenza activity",39103-7
"Influenza activity",40982-1
"Influenza activity",48310-7
"Influenza activity",48509-4
"Influenza activity",5229-0
"Influenza activity",5230-8
"Influenza activity",5860-2
"Influenza activity",5861-0
"Influenza activity",5862-8
"Influenza activity",5863-6
"Influenza activity",5864-4
"Influenza activity",5865-1
"Influenza activity",5866-9
"Influenza activity",5867-7
"Influenza activity",610-6
"Influenza activity",6437-8
"Influenza activity",6438-6
"Influenza activity",6584-7
"Influenza activity",6601-9
"Influenza activity",6602-7
"Influenza activity",6603-5
"Influenza activity",6604-3
"Influenza activity",6634-0
"Influenza activity",6635-7
"Influenza activity",6636-5
"Influenza activity",6637-3
"Influenza activity",6638-1
"Influenza activity",6639-9
"Influenza activity",6640-7
"Influenza activity",6641-5
"Influenza activity",6642-3
"Influenza activity",7920-2
"Influenza activity",7921-0
"Influenza activity",7922-8
"Influenza activity",7923-6
"Influenza activity",7924-4
"Influenza activity",7925-1
"Influenza activity",7926-9
"Influenza activity",7927-7
"Influenza activity",7928-5
"Influenza activity",7929-3
"Influenza activity",7931-9
"Influenza activity",9531-5
"Influenza activity",9532-3
"Influenza activity",9533-1
"Influenza activity",9534-9
"Influenza activity",9535-6
"Influenza activity",9536-4
"Influenza, animal isolates",17012-6
"Influenza, animal isolates",17014-2
"Influenza, animal isolates",17015-9
"Influenza, animal isolates",17016-7
"Influenza, animal isolates",22365-1
"Influenza, animal isolates",22367-7
"Influenza, animal isolates",24015-0
"Influenza, animal isolates",31437-7
"Influenza, animal isolates",31438-5
"Influenza, animal isolates",31858-4
"Influenza, animal isolates",31859-2
"Influenza, animal isolates",31863-4
"Influenza, animal isolates",31864-2
"Influenza, animal isolates",34153-7
"Influenza, animal isolates",34154-5
"Influenza, animal isolates",34487-9
"Influenza, animal isolates",38347-1
"Influenza, animal isolates",38382-8
"Influenza, animal isolates",39102-9
"Influenza, animal isolates",39103-7
"Influenza, animal isolates",40982-1
"Influenza, animal isolates",48310-7
"Influenza, animal isolates",48509-4
"Influenza, animal isolates",5229-0
"Influenza, animal isolates",5230-8
"Influenza, animal isolates",5860-2
"Influenza, animal isolates",5861-0
"Influenza, animal isolates",5862-8
"Influenza, animal isolates",5863-6
"Influenza, animal isolates",5864-4
"Influenza, animal isolates",5865-1
"Influenza, animal isolates",5866-9
"Influenza, animal isolates",5867-7
"Influenza, animal isolates",610-6
"Influenza, animal isolates",6437-8
"Influenza, animal isolates",6438-6
"Influenza, animal isolates",6584-7
"Influenza, animal isolates",6601-9
"Influenza, animal isolates",6602-7
"Influenza, animal isolates",6603-5
"Influenza, animal isolates",6604-3
"Influenza, animal isolates",6634-0
"Influenza, animal isolates",6635-7
"Influenza, animal isolates",6636-5
"Influenza, animal isolates",6637-3
"Influenza, animal isolates",6638-1
"Influenza, animal isolates",6639-9
"Influenza, animal isolates",6640-7
"Influenza, animal isolates",6641-5
"Influenza, animal isolates",6642-3
"Influenza, animal isolates",7920-2
"Influenza, animal isolates",7921-0
"Influenza, animal isolates",7922-8
"Influenza, animal isolates",7923-6
"Influenza, animal isolates",7924-4
"Influenza, animal isolates",7925-1
"Influenza, animal isolates",7926-9
"Influenza, animal isolates",7927-7
"Influenza, animal isolates",7928-5
"Influenza, animal isolates",7929-3
"Influenza, animal isolates",7931-9
"Influenza, animal isolates",9531-5
"Influenza, animal isolates",9532-3
"Influenza, animal isolates",9533-1
"Influenza, animal isolates",9534-9
"Influenza, animal isolates",9535-6
"Influenza, animal isolates",9536-4
"Influenza-associated hospitalization",17012-6
"Influenza-associated hospitalization",17014-2
"Influenza-associated hospitalization",17015-9
"Influenza-associated hospitalization",17016-7
"Influenza-associated hospitalization",22365-1
"Influenza-associated hospitalization",22367-7
"Influenza-associated hospitalization",24015-0
"Influenza-associated hospitalization",31437-7
"Influenza-associated hospitalization",31438-5
"Influenza-associated hospitalization",31858-4
"Influenza-associated hospitalization",31859-2
"Influenza-associated hospitalization",31863-4
"Influenza-associated hospitalization",31864-2
"Influenza-associated hospitalization",34153-7
"Influenza-associated hospitalization",34154-5
"Influenza-associated hospitalization",34487-9
"Influenza-associated hospitalization",38347-1
"Influenza-associated hospitalization",38382-8
"Influenza-associated hospitalization",39102-9
"Influenza-associated hospitalization",39103-7
"Influenza-associated hospitalization",40982-1
"Influenza-associated hospitalization",48310-7
"Influenza-associated hospitalization",48509-4
"Influenza-associated hospitalization",5229-0
"Influenza-associated hospitalization",5230-8
"Influenza-associated hospitalization",5860-2
"Influenza-associated hospitalization",5861-0
"Influenza-associated hospitalization",5862-8
"Influenza-associated hospitalization",5863-6
"Influenza-associated hospitalization",5864-4
"Influenza-associated hospitalization",5865-1
"Influenza-associated hospitalization",5866-9
"Influenza-associated hospitalization",5867-7
"Influenza-associated hospitalization",610-6
"Influenza-associated hospitalization",6437-8
"Influenza-associated hospitalization",6438-6
"Influenza-associated hospitalization",6584-7
"Influenza-associated hospitalization",6601-9
"Influenza-associated hospitalization",6602-7
"Influenza-associated hospitalization",6603-5
"Influenza-associated hospitalization",6604-3
"Influenza-associated hospitalization",6634-0
"Influenza-associated hospitalization",6635-7
"Influenza-associated hospitalization",6636-5
"Influenza-associated hospitalization",6637-3
"Influenza-associated hospitalization",6638-1
"Influenza-associated hospitalization",6639-9
"Influenza-associated hospitalization",6640-7
"Influenza-associated hospitalization",6641-5
"Influenza-associated hospitalization",6642-3
"Influenza-associated hospitalization",7920-2
"Influenza-associated hospitalization",7921-0
"Influenza-associated hospitalization",7922-8
"Influenza-associated hospitalization",7923-6
"Influenza-associated hospitalization",7924-4
"Influenza-associated hospitalization",7925-1
"Influenza-associated hospitalization",7926-9
"Influenza-associated hospitalization",7927-7
"Influenza-associated hospitalization",7928-5
"Influenza-associated hospitalization",7929-3
"Influenza-associated hospitalization",7931-9
"Influenza-associated hospitalization",9531-5
"Influenza-associated hospitalization",9532-3
"Influenza-associated hospitalization",9533-1
"Influenza-associated hospitalization",9534-9
"Influenza-associated hospitalization",9535-6
"Influenza-associated hospitalization",9536-4
"Influenza-associated death in a person under 18",17012-6
"Influenza-associated death in a person under 18",17014-2
"Influenza-associated death in a person under 18",17015-9
"Influenza-associated death in a person under 18",17016-7
"Influenza-associated death in a person under 18",22365-1
"Influenza-associated death in a person under 18",22367-7
"Influenza-associated death in a person under 18",24015-0
"Influenza-associated death in a person under 18",31437-7
"Influenza-associated death in a person under 18",31438-5
"Influenza-associated death in a person under 18",31858-4
"Influenza-associated death in a person under 18",31859-2
"Influenza-associated death in a person under 18",31863-4
"Influenza-associated death in a person under 18",31864-2
"Influenza-associated death in a person under 18",34153-7
"Influenza-associated death in a person under 18",34154-5
"Influenza-associated death in a person under 18",34487-9
"Influenza-associated death in a person under 18",38347-1
"Influenza-associated death in a person under 18",38382-8
"Influenza-associated death in a person under 18",39102-9
"Influenza-associated death in a person under 18",39103-7
"Influenza-associated death in a person under 18",40982-1
"Influenza-associated death in a person under 18",48310-7
"Influenza-associated death in a person under 18",48509-4
"Influenza-associated death in a person under 18",5229-0
"Influenza-associated death in a person under 18",5230-8
"Influenza-associated death in a person under 18",5860-2
"Influenza-associated death in a person under 18",5861-0
"Influenza-associated death in a person under 18",5862-8
"Influenza-associated death in a person under 18",5863-6
"Influenza-associated death in a person under 18",5864-4
"Influenza-associated death in a person under 18",5865-1
"Influenza-associated death in a person under 18",5866-9
"Influenza-associated death in a person under 18",5867-7
"Influenza-associated death in a person under 18",610-6
"Influenza-associated death in a person under 18",6437-8
"Influenza-associated death in a person under 18",6438-6
"Influenza-associated death in a person under 18",6584-7
"Influenza-associated death in a person under 18",6601-9
"Influenza-associated death in a person under 18",6602-7
"Influenza-associated death in a person under 18",6603-5
"Influenza-associated death in a person under 18",6604-3
"Influenza-associated death in a person under 18",6634-0
"Influenza-associated death in a person under 18",6635-7
"Influenza-associated death in a person under 18",6636-5
"Influenza-associated death in a person under 18",6637-3
"Influenza-associated death in a person under 18",6638-1
"Influenza-associated death in a person under 18",6639-9
"Influenza-associated death in a person under 18",6640-7
"Influenza-associated death in a person under 18",6641-5
"Influenza-associated death in a person under 18",6642-3
"Influenza-associated death in a person under 18",7920-2
"Influenza-associated death in a person under 18",7921-0
"Influenza-associated death in a person under 18",7922-8
"Influenza-associated death in a person under 18",7923-6
"Influenza-associated death in a person under 18",7924-4
"Influenza-associated death in a person under 18",7925-1
"Influenza-associated death in a person under 18",7926-9
"Influenza-associated death in a person under 18",7927-7
"Influenza-associated death in a person under 18",7928-5
"Influenza-associated death in a person under 18",7929-3
"Influenza-associated death in a person under 18",7931-9
"Influenza-associated death in a person under 18",9531-5
"Influenza-associated death in a person under 18",9532-3
"Influenza-associated death in a person under 18",9533-1
"Influenza-associated death in a person under 18",9534-9
"Influenza-associated death in a person under 18",9535-6
"Influenza-associated death in a person under 18",9536-4
Japanese encephalitis virus neuroinvasive disease,10896-9
Japanese encephalitis virus neuroinvasive disease,10897-7
Japanese encephalitis virus neuroinvasive disease,10898-5
Japanese encephalitis virus neuroinvasive disease,10899-3
Japanese encephalitis virus neuroinvasive disease,10904-1
Japanese encephalitis virus neuroinvasive disease,10905-8
Japanese encephalitis virus neuroinvasive disease,10906-6
Japanese encephalitis virus neuroinvasive disease,10907-4
Japanese encephalitis virus neuroinvasive disease,13228-2
Japanese encephalitis virus neuroinvasive disease,13229-0
Japanese encephalitis virus neuroinvasive disease,13230-8
Japanese encephalitis virus neuroinvasive disease,13231-6
Japanese encephalitis virus neuroinvasive disease,17036-5
Japanese encephalitis virus neuroinvasive disease,17037-3
Japanese encephalitis virus neuroinvasive disease,17038-1
Japanese encephalitis virus neuroinvasive disease,17039-9
Japanese encephalitis virus neuroinvasive disease,17769-1
Japanese encephalitis virus neuroinvasive disease,17770-9
Japanese encephalitis virus neuroinvasive disease,21509-5
Japanese encephalitis virus neuroinvasive disease,21510-3
Japanese encephalitis virus neuroinvasive disease,23046-6
Japanese encephalitis virus neuroinvasive disease,23991-3
Japanese encephalitis virus neuroinvasive disease,23992-1
Japanese encephalitis virus neuroinvasive disease,29783-8
Japanese encephalitis virus neuroinvasive disease,29785-3
Japanese encephalitis virus neuroinvasive disease,29789-5
Japanese encephalitis virus neuroinvasive disease,30174-7
Japanese encephalitis virus neuroinvasive disease,30175-4
Japanese encephalitis virus neuroinvasive disease,30176-2
Japanese encephalitis virus neuroinvasive disease,30177-0
Japanese encephalitis virus neuroinvasive disease,30179-6
Japanese encephalitis virus neuroinvasive disease,33295-7
Japanese encephalitis virus neuroinvasive disease,34450-7
Japanese encephalitis virus neuroinvasive disease,37983-4
Japanese encephalitis virus neuroinvasive disease,37984-2
Japanese encephalitis virus neuroinvasive disease,41878-0
Japanese encephalitis virus neuroinvasive disease,5073-2
Japanese encephalitis virus neuroinvasive disease,5134-2
Japanese encephalitis virus neuroinvasive disease,5406-4
Japanese encephalitis virus neuroinvasive disease,5883-4
Japanese encephalitis virus neuroinvasive disease,5884-2
Japanese encephalitis virus neuroinvasive disease,5888-3
Japanese encephalitis virus neuroinvasive disease,6309-9
Japanese encephalitis virus neuroinvasive disease,6310-7
Japanese encephalitis virus neuroinvasive disease,6383-4
Japanese encephalitis virus neuroinvasive disease,6388-3
Japanese encephalitis virus neuroinvasive disease,6389-1
Japanese encephalitis virus neuroinvasive disease,6549-0
Japanese encephalitis virus neuroinvasive disease,6585-4
Japanese encephalitis virus neuroinvasive disease,6586-2
Japanese encephalitis virus neuroinvasive disease,6812-2
Japanese encephalitis virus neuroinvasive disease,6957-5
Japanese encephalitis virus neuroinvasive disease,6958-3
Japanese encephalitis virus neuroinvasive disease,7860-0
Japanese encephalitis virus neuroinvasive disease,7861-8
Japanese encephalitis virus neuroinvasive disease,7938-4
Japanese encephalitis virus neuroinvasive disease,7940-0
Japanese encephalitis virus neuroinvasive disease,7941-8
Japanese encephalitis virus neuroinvasive disease,8016-8
Japanese encephalitis virus neuroinvasive disease,8017-6
Japanese encephalitis virus neuroinvasive disease,8021-8
Japanese encephalitis virus neuroinvasive disease,8023-4
Japanese encephalitis virus neuroinvasive disease,8025-9
Japanese encephalitis virus neuroinvasive disease,8052-3
Japanese encephalitis virus neuroinvasive disease,8053-1
Japanese encephalitis virus neuroinvasive disease,9314-6
Japanese encephalitis virus neuroinvasive disease,9315-3
Japanese encephalitis virus neuroinvasive disease,9316-1
Japanese encephalitis virus neuroinvasive disease,9539-8
Japanese encephalitis virus neuroinvasive disease,9540-6
Japanese encephalitis virus neuroinvasive disease,9577-8
Japanese encephalitis virus neuroinvasive disease,9634-7
Japanese encephalitis virus neuroinvasive disease,9635-4
Japanese encephalitis virus non-neuroinvasive disease,10896-9
Japanese encephalitis virus non-neuroinvasive disease,10897-7
Japanese encephalitis virus non-neuroinvasive disease,10898-5
Japanese encephalitis virus non-neuroinvasive disease,10899-3
Japanese encephalitis virus non-neuroinvasive disease,10904-1
Japanese encephalitis virus non-neuroinvasive disease,10905-8
Japanese encephalitis virus non-neuroinvasive disease,10906-6
Japanese encephalitis virus non-neuroinvasive disease,10907-4
Japanese encephalitis virus non-neuroinvasive disease,13228-2
Japanese encephalitis virus non-neuroinvasive disease,13229-0
Japanese encephalitis virus non-neuroinvasive disease,13230-8
Japanese encephalitis virus non-neuroinvasive disease,13231-6
Japanese encephalitis virus non-neuroinvasive disease,17036-5
Japanese encephalitis virus non-neuroinvasive disease,17037-3
Japanese encephalitis virus non-neuroinvasive disease,17038-1
Japanese encephalitis virus non-neuroinvasive disease,17039-9
Japanese encephalitis virus non-neuroinvasive disease,17769-1
Japanese encephalitis virus non-neuroinvasive disease,17770-9
Japanese encephalitis virus non-neuroinvasive disease,21509-5
Japanese encephalitis virus non-neuroinvasive disease,21510-3
Japanese encephalitis virus non-neuroinvasive disease,23046-6
Japanese encephalitis virus non-neuroinvasive disease,23991-3
Japanese encephalitis virus non-neuroinvasive disease,23992-1
Japanese encephalitis virus non-neuroinvasive disease,29783-8
Japanese encephalitis virus non-neuroinvasive disease,29785-3
Japanese encephalitis virus non-neuroinvasive disease,29789-5
Japanese encephalitis virus non-neuroinvasive disease,30174-7
Japanese encephalitis virus non-neuroinvasive disease,30175-4
Japanese encephalitis virus non-neuroinvasive disease,30176-2
Japanese encephalitis virus non-neuroinvasive disease,30177-0
Japanese encephalitis virus non-neuroinvasive disease,30179-6
Japanese encephalitis virus non-neuroinvasive disease,33295-7
Japanese encephalitis virus non-neuroinvasive disease,34450-7
Japanese encephalitis virus non-neuroinvasive disease,37983-4
Japanese encephalitis virus non-neuroinvasive disease,37984-2
Japanese encephalitis virus non-neuroinvasive disease,41878-0
Japanese encephalitis virus non-neuroinvasive disease,5073-2
Japanese encephalitis virus non-neuroinvasive disease,5134-2
Japanese encephalitis virus non-neuroinvasive disease,5406-4
Japanese encephalitis virus non-neuroinvasive disease,5883-4
Japanese encephalitis virus non-neuroinvasive disease,5884-2
Japanese encephalitis virus non-neuroinvasive disease,5888-3
Japanese encephalitis virus non-neuroinvasive disease,6309-9
Japanese encephalitis virus non-neuroinvasive disease,6310-7
Japanese encephalitis virus non-neuroinvasive disease,6383-4
Japanese encephalitis virus non-neuroinvasive disease,6388-3
Japanese encephalitis virus non-neuroinvasive disease,6389-1
Japanese encephalitis virus non-neuroinvasive disease,6549-0
Japanese encephalitis virus non-neuroinvasive disease,6585-4
Japanese encephalitis virus non-neuroinvasive disease,6586-2
Japanese encephalitis virus non-neuroinvasive disease,6812-2
Japanese encephalitis virus non-neuroinvasive disease,6957-5
Japanese encephalitis virus non-neuroinvasive disease,6958-3
Japanese encephalitis virus non-neuroinvasive disease,7860-0
Japanese encephalitis virus non-neuroinvasive disease,7861-8
Japanese encephalitis virus non-neuroinvasive disease,7938-4
Japanese encephalitis virus non-neuroinvasive disease,7940-0
Japanese encephalitis virus non-neuroinvasive disease,7941-8
Japanese encephalitis virus non-neuroinvasive disease,8016-8
Japanese encephalitis virus non-neuroinvasive disease,8017-6
Japanese encephalitis virus non-neuroinvasive disease,8021-8
Japanese encephalitis virus non-neuroinvasive disease,8023-4
Japanese encephalitis virus non-neuroinvasive disease,8025-9
Japanese encephalitis virus non-neuroinvasive disease,8052-3
Japanese encephalitis virus non-neuroinvasive disease,8053-1
Japanese encephalitis virus non-neuroinvasive disease,9314-6
Japanese encephalitis virus non-neuroinvasive disease,9315-3
Japanese encephalitis virus non-neuroinvasive disease,9316-1
Japanese encephalitis virus non-neuroinvasive disease,9539-8
Japanese encephalitis virus non-neuroinvasive disease,9540-6
Japanese encephalitis virus non-neuroinvasive disease,9577-8
Japanese encephalitis virus non-neuroinvasive disease,9634-7
Japanese encephalitis virus non-neuroinvasive disease,9635-4
LEGIONELLOSIS,11475-1
LEGIONELLOSIS,13254-8
LEGIONELLOSIS,13255-5
LEGIONELLOSIS,16133-1
LEGIONELLOSIS,17057-1
LEGIONELLOSIS,17058-9
LEGIONELLOSIS,17060-5
LEGIONELLOSIS,17061-3
LEGIONELLOSIS,21363-7
LEGIONELLOSIS,22382-6
LEGIONELLOSIS,22398-2
LEGIONELLOSIS,31870-9
LEGIONELLOSIS,32355-0
LEGIONELLOSIS,32696-7
LEGIONELLOSIS,38347-1
LEGIONELLOSIS,41499-5
LEGIONELLOSIS,41852-5
LEGIONELLOSIS,49914-5
LEGIONELLOSIS,5236-5
LEGIONELLOSIS,5237-3
LEGIONELLOSIS,588-4
LEGIONELLOSIS,589-2
LEGIONELLOSIS,590-0
LEGIONELLOSIS,593-4
LEGIONELLOSIS,597-5
LEGIONELLOSIS,600-7
LEGIONELLOSIS,604-9
LEGIONELLOSIS,622-1
LEGIONELLOSIS,624-7
LEGIONELLOSIS,634-6
LEGIONELLOSIS,636-1
LEGIONELLOSIS,6445-1
LEGIONELLOSIS,6447-7
LEGIONELLOSIS,6448-5
LEGIONELLOSIS,6451-9
LEGIONELLOSIS,7947-5
LEGIONELLOSIS,7948-3
LEGIONELLOSIS,9541-4
LEGIONELLOSIS,9542-2
LEGIONELLOSIS,9543-0
LEGIONELLOSIS,9551-3
LEGIONELLOSIS,9552-1
LISTERIOSIS,11475-1
LISTERIOSIS,41852-5
LISTERIOSIS,600-7
LISTERIOSIS,610-6
LISTERIOSIS,627-0
LISTERIOSIS,634-6
LISTERIOSIS,636-1
LISTERIOSIS,6463-4
LISTERIOSIS,6609-2
LYME DISEASE,10847-2
LYME DISEASE,11006-4
LYME DISEASE,11550-1
LYME DISEASE,12781-1
LYME DISEASE,12860-3
LYME DISEASE,12862-9
LYME DISEASE,12863-7
LYME DISEASE,12867-8
LYME DISEASE,12869-4
LYME DISEASE,13202-7
LYME DISEASE,13203-5
LYME DISEASE,13204-3
LYME DISEASE,13205-0
LYME DISEASE,13503-8
LYME DISEASE,13504-6
LYME DISEASE,14077-2
LYME DISEASE,14078-0
LYME DISEASE,16475-6
LYME DISEASE,16480-6
LYME DISEASE,18201-4
LYME DISEASE,18202-2
LYME DISEASE,18203-0
LYME DISEASE,20449-5
LYME DISEASE,22119-2
LYME DISEASE,22122-6
LYME DISEASE,22135-8
LYME DISEASE,23833-7
LYME DISEASE,23979-8
LYME DISEASE,23981-4
LYME DISEASE,23982-2
LYME DISEASE,23983-0
LYME DISEASE,23985-5
LYME DISEASE,29898-4
LYME DISEASE,30526-8
LYME DISEASE,32669-4
LYME DISEASE,34148-7
LYME DISEASE,38173-1
LYME DISEASE,38174-9
LYME DISEASE,4991-6
LYME DISEASE,5060-9
LYME DISEASE,5061-7
LYME DISEASE,5062-5
LYME DISEASE,5063-3
LYME DISEASE,5064-1
LYME DISEASE,5065-8
LYME DISEASE,6318-0
LYME DISEASE,6320-6
LYME DISEASE,6321-4
LYME DISEASE,6323-0
LYME DISEASE,6471-7
LYME DISEASE,7817-0
LYME DISEASE,7818-8
LYME DISEASE,9586-9
LYMPHOGRANULOMA VENEREUM (LGV),43174-2
LYMPHOGRANULOMA VENEREUM (LGV),47211-8
LYMPHOGRANULOMA VENEREUM (LGV),47212-6
MALARIA,10709-4
MALARIA,10710-2
MALARIA,11546-9
MALARIA,32206-5
MALARIA,32700-7
MALARIA,38347-1
MALARIA,637-9
MALARIA,662-7
"Measles (rubeola)",13283-7
"Measles (rubeola)",14304-0
"Measles (rubeola)",14305-7
"Measles (rubeola)",17553-9
"Measles (rubeola)",20479-2
"Measles (rubeola)",21501-2
"Measles (rubeola)",21502-0
"Measles (rubeola)",22502-9
"Measles (rubeola)",22506-0
"Measles (rubeola)",25421-9
"Measles (rubeola)",35276-5
"Measles (rubeola)",5242-3
"Measles (rubeola)",5243-1
"Measles (rubeola)",5244-9
"Measles (rubeola)",5245-6
"Measles (rubeola)",5886-7
"Measles (rubeola)",7961-6
"Measles (rubeola)",7962-4
"Measles (rubeola)",7963-2
"Measles (rubeola)",9566-1
"Meningitis, Bacterial other",11473-6
"Meningitis, Aseptic",11473-6
"Meningitis, Viral",11473-6
Meningococcal disease (Neisseria meningitidis),10353-1
Meningococcal disease (Neisseria meningitidis),11475-1
Meningococcal disease (Neisseria meningitidis),16134-9
Meningococcal disease (Neisseria meningitidis),17324-5
Meningococcal disease (Neisseria meningitidis),17326-0
Meningococcal disease (Neisseria meningitidis),17329-4
Meningococcal disease (Neisseria meningitidis),17330-2
Meningococcal disease (Neisseria meningitidis),17332-8
Meningococcal disease (Neisseria meningitidis),19022-3
Meningococcal disease (Neisseria meningitidis),19133-8
Meningococcal disease (Neisseria meningitidis),19134-6
Meningococcal disease (Neisseria meningitidis),19259-1
Meningococcal disease (Neisseria meningitidis),23667-9
Meningococcal disease (Neisseria meningitidis),38347-1
Meningococcal disease (Neisseria meningitidis),41852-5
Meningococcal disease (Neisseria meningitidis),49671-1
Meningococcal disease (Neisseria meningitidis),600-7
Meningococcal disease (Neisseria meningitidis),606-4
Meningococcal disease (Neisseria meningitidis),636-1
Meningococcal disease (Neisseria meningitidis),6463-4
Meningococcal disease (Neisseria meningitidis),6493-1
Meningococcal disease (Neisseria meningitidis),6494-9
Meningococcal disease (Neisseria meningitidis),6496-4
Meningococcal disease (Neisseria meningitidis),6497-2
Meningococcal disease (Neisseria meningitidis),6498-0
Meningococcal disease (Neisseria meningitidis),6499-8
Meningococcal disease (Neisseria meningitidis),6500-3
Meningococcal disease (Neisseria meningitidis),6503-7
Meningococcal disease (Neisseria meningitidis),6504-5
Meningococcal disease (Neisseria meningitidis),6505-2
Meningococcal disease (Neisseria meningitidis),6506-0
Meningococcal disease (Neisseria meningitidis),6507-8
Meningococcal disease (Neisseria meningitidis),6508-6
Meningococcal disease (Neisseria meningitidis),6509-4
MUMPS,13266-2
MUMPS,13267-0
MUMPS,13921-2
MUMPS,14545-8
MUMPS,22414-7
MUMPS,22415-4
MUMPS,25418-5
MUMPS,25419-3
MUMPS,5249-8
MUMPS,5250-6
MUMPS,5883-4
MUMPS,5887-5
MUMPS,6476-6
MUMPS,6477-4
MUMPS,6478-2
MUMPS,6479-0
MUMPS,7966-5
MUMPS,7967-3
MUMPS,7968-1
MUMPS,9567-9
NOROVIRUS,38916-3
PERTUSSIS,10353-1
PERTUSSIS,11475-1
PERTUSSIS,23826-1
PERTUSSIS,23827-9
PERTUSSIS,23828-7
PERTUSSIS,23830-3
PERTUSSIS,23831-1
PERTUSSIS,24127-3
PERTUSSIS,24128-1
PERTUSSIS,24129-9
PERTUSSIS,25332-8
PERTUSSIS,32355-0
PERTUSSIS,38347-1
PERTUSSIS,42329-3
PERTUSSIS,548-8
PERTUSSIS,549-6
PERTUSSIS,550-4
PERTUSSIS,597-5
PERTUSSIS,600-7
PERTUSSIS,604-9
PERTUSSIS,626-2
PERTUSSIS,6315-6
PERTUSSIS,6317-2
PERTUSSIS,6463-4
PERTUSSIS,9362-5
PERTUSSIS,9364-1
PLAGUE,11475-1
PLAGUE,41400-3
PLAGUE,41401-1
PLAGUE,48410-5
PLAGUE,600-7
PLAGUE,605-6
PLAGUE,610-6
PLAGUE,625-4
PLAGUE,634-6
PLAGUE,636-1
PLAGUE,6463-4
PLAGUE,701-3
"Poliovirus infection, nonparalytic",10736-7
"Poliovirus infection, nonparalytic",10737-5
"Poliovirus infection, nonparalytic",12272-1
"Poliovirus infection, nonparalytic",14488-1
"Poliovirus infection, nonparalytic",14489-9
"Poliovirus infection, nonparalytic",14491-5
"Poliovirus infection, nonparalytic",16284-2
"Poliovirus infection, nonparalytic",5883-4
"Poliovirus infection, nonparalytic",5884-2
"Poliovirus infection, nonparalytic",5886-7
"Poliovirus infection, nonparalytic",5887-5
"Poliomyelitis, paralytic",10736-7
"Poliomyelitis, paralytic",10737-5
"Poliomyelitis, paralytic",12272-1
"Poliomyelitis, paralytic",14488-1
"Poliomyelitis, paralytic",14489-9
"Poliomyelitis, paralytic",14491-5
"Poliomyelitis, paralytic",16284-2
"Poliomyelitis, paralytic",5883-4
"Poliomyelitis, paralytic",5884-2
"Poliomyelitis, paralytic",5886-7
"Poliomyelitis, paralytic",5887-5
Powassan virus neuroinvasive disease,10896-9
Powassan virus neuroinvasive disease,10897-7
Powassan virus neuroinvasive disease,10898-5
Powassan virus neuroinvasive disease,10899-3
Powassan virus neuroinvasive disease,10904-1
Powassan virus neuroinvasive disease,10905-8
Powassan virus neuroinvasive disease,10906-6
Powassan virus neuroinvasive disease,10907-4
Powassan virus neuroinvasive disease,13228-2
Powassan virus neuroinvasive disease,13229-0
Powassan virus neuroinvasive disease,13230-8
Powassan virus neuroinvasive disease,13231-6
Powassan virus neuroinvasive disease,17036-5
Powassan virus neuroinvasive disease,17037-3
Powassan virus neuroinvasive disease,17038-1
Powassan virus neuroinvasive disease,17039-9
Powassan virus neuroinvasive disease,17769-1
Powassan virus neuroinvasive disease,17770-9
Powassan virus neuroinvasive disease,21509-5
Powassan virus neuroinvasive disease,21510-3
Powassan virus neuroinvasive disease,23046-6
Powassan virus neuroinvasive disease,23991-3
Powassan virus neuroinvasive disease,23992-1
Powassan virus neuroinvasive disease,29783-8
Powassan virus neuroinvasive disease,29785-3
Powassan virus neuroinvasive disease,29789-5
Powassan virus neuroinvasive disease,30174-7
Powassan virus neuroinvasive disease,30175-4
Powassan virus neuroinvasive disease,30176-2
Powassan virus neuroinvasive disease,30177-0
Powassan virus neuroinvasive disease,30179-6
Powassan virus neuroinvasive disease,33295-7
Powassan virus neuroinvasive disease,34450-7
Powassan virus neuroinvasive disease,37983-4
Powassan virus neuroinvasive disease,37984-2
Powassan virus neuroinvasive disease,41878-0
Powassan virus neuroinvasive disease,5073-2
Powassan virus neuroinvasive disease,5134-2
Powassan virus neuroinvasive disease,5406-4
Powassan virus neuroinvasive disease,5883-4
Powassan virus neuroinvasive disease,5884-2
Powassan virus neuroinvasive disease,5888-3
Powassan virus neuroinvasive disease,6309-9
Powassan virus neuroinvasive disease,6310-7
Powassan virus neuroinvasive disease,6383-4
Powassan virus neuroinvasive disease,6388-3
Powassan virus neuroinvasive disease,6389-1
Powassan virus neuroinvasive disease,6549-0
Powassan virus neuroinvasive disease,6585-4
Powassan virus neuroinvasive disease,6586-2
Powassan virus neuroinvasive disease,6812-2
Powassan virus neuroinvasive disease,6957-5
Powassan virus neuroinvasive disease,6958-3
Powassan virus neuroinvasive disease,7860-0
Powassan virus neuroinvasive disease,7861-8
Powassan virus neuroinvasive disease,7938-4
Powassan virus neuroinvasive disease,7940-0
Powassan virus neuroinvasive disease,7941-8
Powassan virus neuroinvasive disease,8016-8
Powassan virus neuroinvasive disease,8017-6
Powassan virus neuroinvasive disease,8021-8
Powassan virus neuroinvasive disease,8023-4
Powassan virus neuroinvasive disease,8025-9
Powassan virus neuroinvasive disease,8052-3
Powassan virus neuroinvasive disease,8053-1
Powassan virus neuroinvasive disease,9314-6
Powassan virus neuroinvasive disease,9315-3
Powassan virus neuroinvasive disease,9316-1
Powassan virus neuroinvasive disease,9539-8
Powassan virus neuroinvasive disease,9540-6
Powassan virus neuroinvasive disease,9577-8
Powassan virus neuroinvasive disease,9634-7
Powassan virus neuroinvasive disease,9635-4
Powassan virus non-neuroinvasive disease,10896-9
Powassan virus non-neuroinvasive disease,10897-7
Powassan virus non-neuroinvasive disease,10898-5
Powassan virus non-neuroinvasive disease,10899-3
Powassan virus non-neuroinvasive disease,10904-1
Powassan virus non-neuroinvasive disease,10905-8
Powassan virus non-neuroinvasive disease,10906-6
Powassan virus non-neuroinvasive disease,10907-4
Powassan virus non-neuroinvasive disease,13228-2
Powassan virus non-neuroinvasive disease,13229-0
Powassan virus non-neuroinvasive disease,13230-8
Powassan virus non-neuroinvasive disease,13231-6
Powassan virus non-neuroinvasive disease,17036-5
Powassan virus non-neuroinvasive disease,17037-3
Powassan virus non-neuroinvasive disease,17038-1
Powassan virus non-neuroinvasive disease,17039-9
Powassan virus non-neuroinvasive disease,17769-1
Powassan virus non-neuroinvasive disease,17770-9
Powassan virus non-neuroinvasive disease,21509-5
Powassan virus non-neuroinvasive disease,21510-3
Powassan virus non-neuroinvasive disease,23046-6
Powassan virus non-neuroinvasive disease,23991-3
Powassan virus non-neuroinvasive disease,23992-1
Powassan virus non-neuroinvasive disease,29783-8
Powassan virus non-neuroinvasive disease,29785-3
Powassan virus non-neuroinvasive disease,29789-5
Powassan virus non-neuroinvasive disease,30174-7
Powassan virus non-neuroinvasive disease,30175-4
Powassan virus non-neuroinvasive disease,30176-2
Powassan virus non-neuroinvasive disease,30177-0
Powassan virus non-neuroinvasive disease,30179-6
Powassan virus non-neuroinvasive disease,33295-7
Powassan virus non-neuroinvasive disease,34450-7
Powassan virus non-neuroinvasive disease,37983-4
Powassan virus non-neuroinvasive disease,37984-2
Powassan virus non-neuroinvasive disease,41878-0
Powassan virus non-neuroinvasive disease,5073-2
Powassan virus non-neuroinvasive disease,5134-2
Powassan virus non-neuroinvasive disease,5406-4
Powassan virus non-neuroinvasive disease,5883-4
Powassan virus non-neuroinvasive disease,5884-2
Powassan virus non-neuroinvasive disease,5888-3
Powassan virus non-neuroinvasive disease,6309-9
Powassan virus non-neuroinvasive disease,6310-7
Powassan virus non-neuroinvasive disease,6383-4
Powassan virus non-neuroinvasive disease,6388-3
Powassan virus non-neuroinvasive disease,6389-1
Powassan virus non-neuroinvasive disease,6549-0
Powassan virus non-neuroinvasive disease,6585-4
Powassan virus non-neuroinvasive disease,6586-2
Powassan virus non-neuroinvasive disease,6812-2
Powassan virus non-neuroinvasive disease,6957-5
Powassan virus non-neuroinvasive disease,6958-3
Powassan virus non-neuroinvasive disease,7860-0
Powassan virus non-neuroinvasive disease,7861-8
Powassan virus non-neuroinvasive disease,7938-4
Powassan virus non-neuroinvasive disease,7940-0
Powassan virus non-neuroinvasive disease,7941-8
Powassan virus non-neuroinvasive disease,8016-8
Powassan virus non-neuroinvasive disease,8017-6
Powassan virus non-neuroinvasive disease,8021-8
Powassan virus non-neuroinvasive disease,8023-4
Powassan virus non-neuroinvasive disease,8025-9
Powassan virus non-neuroinvasive disease,8052-3
Powassan virus non-neuroinvasive disease,8053-1
Powassan virus non-neuroinvasive disease,9314-6
Powassan virus non-neuroinvasive disease,9315-3
Powassan virus non-neuroinvasive disease,9316-1
Powassan virus non-neuroinvasive disease,9539-8
Powassan virus non-neuroinvasive disease,9540-6
Powassan virus non-neuroinvasive disease,9577-8
Powassan virus non-neuroinvasive disease,9634-7
Powassan virus non-neuroinvasive disease,9635-4
Psittacosis,14198-6
Psittacosis,16589-4
Psittacosis,20752-2
Psittacosis,22180-4
Psittacosis,22181-2
Psittacosis,35713-7
Psittacosis,5079-9
Psittacosis,5084-9
Psittacosis,558-7
Psittacosis,560-3
Psittacosis,6348-7
Psittacosis,6915-3
Psittacosis,6916-1
Psittacosis,6917-9
"Q fever, chronic",23018-5
"Q fever, chronic",7828-7
"Q fever, chronic",7829-5
"Q fever, chronic",7830-3
"Q fever, chronic",9708-9
"Q fever, chronic",9709-7
"Q fever, chronic",9710-5
"Q fever, chronic",9711-3
"Q fever, acute",23018-5
"Q fever, acute",7828-7
"Q fever, acute",7829-5
"Q fever, acute",7830-3
"Q fever, acute",9708-9
"Q fever, acute",9709-7
"Q fever, acute",9710-5
"Q fever, acute",9711-3
"Q fever",23018-5
"Q fever",7828-7
"Q fever",7829-5
"Q fever",7830-3
"Q fever",9708-9
"Q fever",9709-7
"Q fever",9710-5
"Q fever",9711-3
"Rabies, human",6523-5
"Rabies, human",6524-3
"Rabies, human",6527-6
"Rabies, human",6528-4
"Rabies, human",6529-2
"Rabies, human",6532-6
"Rabies, human",6533-4
"Rabies, animal",6523-5
"Rabies, animal",6524-3
"Rabies, animal",6527-6
"Rabies, animal",6528-4
"Rabies, animal",6529-2
"Rabies, animal",6532-6
"Rabies, animal",6533-4
ROCKY MOUNTAIN SPOTTED FEVER,11482-7
ROCKY MOUNTAIN SPOTTED FEVER,17537-2
ROCKY MOUNTAIN SPOTTED FEVER,17538-0
ROCKY MOUNTAIN SPOTTED FEVER,18429-1
ROCKY MOUNTAIN SPOTTED FEVER,18430-9
ROCKY MOUNTAIN SPOTTED FEVER,5307-4
ROCKY MOUNTAIN SPOTTED FEVER,5308-2
ROCKY MOUNTAIN SPOTTED FEVER,5310-8
ROCKY MOUNTAIN SPOTTED FEVER,5311-6
ROCKY MOUNTAIN SPOTTED FEVER,5312-4
ROCKY MOUNTAIN SPOTTED FEVER,5313-2
ROCKY MOUNTAIN SPOTTED FEVER,5314-0
ROCKY MOUNTAIN SPOTTED FEVER,5315-7
ROCKY MOUNTAIN SPOTTED FEVER,5878-4
ROCKY MOUNTAIN SPOTTED FEVER,6543-3
ROCKY MOUNTAIN SPOTTED FEVER,6544-1
ROCKY MOUNTAIN SPOTTED FEVER,6545-8
ROCKY MOUNTAIN SPOTTED FEVER,6546-6
ROCKY MOUNTAIN SPOTTED FEVER,7997-0
ROCKY MOUNTAIN SPOTTED FEVER,7998-8
ROCKY MOUNTAIN SPOTTED FEVER,7999-6
ROCKY MOUNTAIN SPOTTED FEVER,8003-6
ROCKY MOUNTAIN SPOTTED FEVER,8004-4
ROCKY MOUNTAIN SPOTTED FEVER,8005-1
"Rubella, congenital syndrome",13279-5
"Rubella, congenital syndrome",13282-9
"Rubella, congenital syndrome",17551-3
"Rubella, congenital syndrome",17552-1
"Rubella, congenital syndrome",24116-6
"Rubella, congenital syndrome",25514-1
"Rubella, congenital syndrome",5334-8
"Rubella, congenital syndrome",5335-5
"Rubella, congenital syndrome",5883-4
"Rubella, congenital syndrome",5884-2
"Rubella, congenital syndrome",5887-5
"Rubella, congenital syndrome",6548-2
"Rubella, congenital syndrome",8015-0
"Rubella, congenital syndrome",9576-0
Rubella,13279-5
Rubella,13282-9
Rubella,17551-3
Rubella,17552-1
Rubella,24116-6
Rubella,25514-1
Rubella,5334-8
Rubella,5335-5
Rubella,5883-4
Rubella,5884-2
Rubella,5887-5
Rubella,6548-2
Rubella,8015-0
Rubella,9576-0
Salmonellosis,10354-9
Salmonellosis,11475-1
Salmonellosis,13284-5
Salmonellosis,17563-8
Salmonellosis,17969-7
Salmonellosis,20474-3
Salmonellosis,20951-0
Salmonellosis,22517-7
Salmonellosis,23602-6
Salmonellosis,38347-1
Salmonellosis,41852-5
Salmonellosis,597-5
Salmonellosis,600-7
Salmonellosis,604-9
Salmonellosis,605-6
Salmonellosis,606-4
Salmonellosis,610-6
Salmonellosis,611-4
Salmonellosis,621-3
Salmonellosis,622-1
Salmonellosis,624-7
Salmonellosis,625-4
Salmonellosis,626-2
Salmonellosis,627-0
Salmonellosis,630-4
Salmonellosis,632-0
Salmonellosis,634-6
Salmonellosis,636-1
Salmonellosis,6460-0
Salmonellosis,6462-6
Salmonellosis,6463-4
Severe Acute Respiratory Syndrome (SARS),33964-8
Severe Acute Respiratory Syndrome (SARS),33968-9
SHIGELLOSIS,10354-9
SHIGELLOSIS,11475-1
SHIGELLOSIS,17576-0
SHIGELLOSIS,42190-9
SHIGELLOSIS,600-7
SHIGELLOSIS,625-4
SHIGELLOSIS,630-4
SHIGELLOSIS,634-6
SHIGELLOSIS,636-1
SHIGELLOSIS,6463-4
Vancomycin-resistant Staphylococcus aureus (VRSA),610-6
Shiga toxin-producing Escherichia coli (STEC),10851-4
Shiga toxin-producing Escherichia coli (STEC),11475-1
Shiga toxin-producing Escherichia coli (STEC),12276-2
Shiga toxin-producing Escherichia coli (STEC),16835-1
Shiga toxin-producing Escherichia coli (STEC),17969-7
Shiga toxin-producing Escherichia coli (STEC),21262-1
Shiga toxin-producing Escherichia coli (STEC),33764-2
Shiga toxin-producing Escherichia coli (STEC),41852-5
Shiga toxin-producing Escherichia coli (STEC),44088-3
Shiga toxin-producing Escherichia coli (STEC),600-7
Shiga toxin-producing Escherichia coli (STEC),625-4
Shiga toxin-producing Escherichia coli (STEC),6463-4
St. Louis encephalitis virus neuroinvasive disease,10896-9
St. Louis encephalitis virus neuroinvasive disease,10897-7
St. Louis encephalitis virus neuroinvasive disease,10898-5
St. Louis encephalitis virus neuroinvasive disease,10899-3
St. Louis encephalitis virus neuroinvasive disease,10904-1
St. Louis encephalitis virus neuroinvasive disease,10905-8
St. Louis encephalitis virus neuroinvasive disease,10906-6
St. Louis encephalitis virus neuroinvasive disease,10907-4
St. Louis encephalitis virus neuroinvasive disease,13228-2
St. Louis encephalitis virus neuroinvasive disease,13229-0
St. Louis encephalitis virus neuroinvasive disease,13230-8
St. Louis encephalitis virus neuroinvasive disease,13231-6
St. Louis encephalitis virus neuroinvasive disease,17036-5
St. Louis encephalitis virus neuroinvasive disease,17037-3
St. Louis encephalitis virus neuroinvasive disease,17038-1
St. Louis encephalitis virus neuroinvasive disease,17039-9
St. Louis encephalitis virus neuroinvasive disease,17769-1
St. Louis encephalitis virus neuroinvasive disease,17770-9
St. Louis encephalitis virus neuroinvasive disease,21509-5
St. Louis encephalitis virus neuroinvasive disease,21510-3
St. Louis encephalitis virus neuroinvasive disease,23046-6
St. Louis encephalitis virus neuroinvasive disease,23991-3
St. Louis encephalitis virus neuroinvasive disease,23992-1
St. Louis encephalitis virus neuroinvasive disease,29783-8
St. Louis encephalitis virus neuroinvasive disease,29785-3
St. Louis encephalitis virus neuroinvasive disease,29789-5
St. Louis encephalitis virus neuroinvasive disease,30174-7
St. Louis encephalitis virus neuroinvasive disease,30175-4
St. Louis encephalitis virus neuroinvasive disease,30176-2
St. Louis encephalitis virus neuroinvasive disease,30177-0
St. Louis encephalitis virus neuroinvasive disease,30179-6
St. Louis encephalitis virus neuroinvasive disease,33295-7
St. Louis encephalitis virus neuroinvasive disease,34450-7
St. Louis encephalitis virus neuroinvasive disease,37983-4
St. Louis encephalitis virus neuroinvasive disease,37984-2
St. Louis encephalitis virus neuroinvasive disease,41878-0
St. Louis encephalitis virus neuroinvasive disease,5073-2
St. Louis encephalitis virus neuroinvasive disease,5134-2
St. Louis encephalitis virus neuroinvasive disease,5406-4
St. Louis encephalitis virus neuroinvasive disease,5883-4
St. Louis encephalitis virus neuroinvasive disease,5884-2
St. Louis encephalitis virus neuroinvasive disease,5888-3
St. Louis encephalitis virus neuroinvasive disease,6309-9
St. Louis encephalitis virus neuroinvasive disease,6310-7
St. Louis encephalitis virus neuroinvasive disease,6383-4
St. Louis encephalitis virus neuroinvasive disease,6388-3
St. Louis encephalitis virus neuroinvasive disease,6389-1
St. Louis encephalitis virus neuroinvasive disease,6549-0
St. Louis encephalitis virus neuroinvasive disease,6585-4
St. Louis encephalitis virus neuroinvasive disease,6586-2
St. Louis encephalitis virus neuroinvasive disease,6812-2
St. Louis encephalitis virus neuroinvasive disease,6957-5
St. Louis encephalitis virus neuroinvasive disease,6958-3
St. Louis encephalitis virus neuroinvasive disease,7860-0
St. Louis encephalitis virus neuroinvasive disease,7861-8
St. Louis encephalitis virus neuroinvasive disease,7938-4
St. Louis encephalitis virus neuroinvasive disease,7940-0
St. Louis encephalitis virus neuroinvasive disease,7941-8
St. Louis encephalitis virus neuroinvasive disease,8016-8
St. Louis encephalitis virus neuroinvasive disease,8017-6
St. Louis encephalitis virus neuroinvasive disease,8021-8
St. Louis encephalitis virus neuroinvasive disease,8023-4
St. Louis encephalitis virus neuroinvasive disease,8025-9
St. Louis encephalitis virus neuroinvasive disease,8052-3
St. Louis encephalitis virus neuroinvasive disease,8053-1
St. Louis encephalitis virus neuroinvasive disease,9314-6
St. Louis encephalitis virus neuroinvasive disease,9315-3
St. Louis encephalitis virus neuroinvasive disease,9316-1
St. Louis encephalitis virus neuroinvasive disease,9539-8
St. Louis encephalitis virus neuroinvasive disease,9540-6
St. Louis encephalitis virus neuroinvasive disease,9577-8
St. Louis encephalitis virus neuroinvasive disease,9634-7
St. Louis encephalitis virus neuroinvasive disease,9635-4
St. Louis encephalitis virus non-neuroinvasive disease,10896-9
St. Louis encephalitis virus non-neuroinvasive disease,10897-7
St. Louis encephalitis virus non-neuroinvasive disease,10898-5
St. Louis encephalitis virus non-neuroinvasive disease,10899-3
St. Louis encephalitis virus non-neuroinvasive disease,10904-1
St. Louis encephalitis virus non-neuroinvasive disease,10905-8
St. Louis encephalitis virus non-neuroinvasive disease,10906-6
St. Louis encephalitis virus non-neuroinvasive disease,10907-4
St. Louis encephalitis virus non-neuroinvasive disease,13228-2
St. Louis encephalitis virus non-neuroinvasive disease,13229-0
St. Louis encephalitis virus non-neuroinvasive disease,13230-8
St. Louis encephalitis virus non-neuroinvasive disease,13231-6
St. Louis encephalitis virus non-neuroinvasive disease,17036-5
St. Louis encephalitis virus non-neuroinvasive disease,17037-3
St. Louis encephalitis virus non-neuroinvasive disease,17038-1
St. Louis encephalitis virus non-neuroinvasive disease,17039-9
St. Louis encephalitis virus non-neuroinvasive disease,17769-1
St. Louis encephalitis virus non-neuroinvasive disease,17770-9
St. Louis encephalitis virus non-neuroinvasive disease,21509-5
St. Louis encephalitis virus non-neuroinvasive disease,21510-3
St. Louis encephalitis virus non-neuroinvasive disease,23046-6
St. Louis encephalitis virus non-neuroinvasive disease,23991-3
St. Louis encephalitis virus non-neuroinvasive disease,23992-1
St. Louis encephalitis virus non-neuroinvasive disease,29783-8
St. Louis encephalitis virus non-neuroinvasive disease,29785-3
St. Louis encephalitis virus non-neuroinvasive disease,29789-5
St. Louis encephalitis virus non-neuroinvasive disease,30174-7
St. Louis encephalitis virus non-neuroinvasive disease,30175-4
St. Louis encephalitis virus non-neuroinvasive disease,30176-2
St. Louis encephalitis virus non-neuroinvasive disease,30177-0
St. Louis encephalitis virus non-neuroinvasive disease,30179-6
St. Louis encephalitis virus non-neuroinvasive disease,33295-7
St. Louis encephalitis virus non-neuroinvasive disease,34450-7
St. Louis encephalitis virus non-neuroinvasive disease,37983-4
St. Louis encephalitis virus non-neuroinvasive disease,37984-2
St. Louis encephalitis virus non-neuroinvasive disease,41878-0
St. Louis encephalitis virus non-neuroinvasive disease,5073-2
St. Louis encephalitis virus non-neuroinvasive disease,5134-2
St. Louis encephalitis virus non-neuroinvasive disease,5406-4
St. Louis encephalitis virus non-neuroinvasive disease,5883-4
St. Louis encephalitis virus non-neuroinvasive disease,5884-2
St. Louis encephalitis virus non-neuroinvasive disease,5888-3
St. Louis encephalitis virus non-neuroinvasive disease,6309-9
St. Louis encephalitis virus non-neuroinvasive disease,6310-7
St. Louis encephalitis virus non-neuroinvasive disease,6383-4
St. Louis encephalitis virus non-neuroinvasive disease,6388-3
St. Louis encephalitis virus non-neuroinvasive disease,6389-1
St. Louis encephalitis virus non-neuroinvasive disease,6549-0
St. Louis encephalitis virus non-neuroinvasive disease,6585-4
St. Louis encephalitis virus non-neuroinvasive disease,6586-2
St. Louis encephalitis virus non-neuroinvasive disease,6812-2
St. Louis encephalitis virus non-neuroinvasive disease,6957-5
St. Louis encephalitis virus non-neuroinvasive disease,6958-3
St. Louis encephalitis virus non-neuroinvasive disease,7860-0
St. Louis encephalitis virus non-neuroinvasive disease,7861-8
St. Louis encephalitis virus non-neuroinvasive disease,7938-4
St. Louis encephalitis virus non-neuroinvasive disease,7940-0
St. Louis encephalitis virus non-neuroinvasive disease,7941-8
St. Louis encephalitis virus non-neuroinvasive disease,8016-8
St. Louis encephalitis virus non-neuroinvasive disease,8017-6
St. Louis encephalitis virus non-neuroinvasive disease,8021-8
St. Louis encephalitis virus non-neuroinvasive disease,8023-4
St. Louis encephalitis virus non-neuroinvasive disease,8025-9
St. Louis encephalitis virus non-neuroinvasive disease,8052-3
St. Louis encephalitis virus non-neuroinvasive disease,8053-1
St. Louis encephalitis virus non-neuroinvasive disease,9314-6
St. Louis encephalitis virus non-neuroinvasive disease,9315-3
St. Louis encephalitis virus non-neuroinvasive disease,9316-1
St. Louis encephalitis virus non-neuroinvasive disease,9539-8
St. Louis encephalitis virus non-neuroinvasive disease,9540-6
St. Louis encephalitis virus non-neuroinvasive disease,9577-8
St. Louis encephalitis virus non-neuroinvasive disease,9634-7
St. Louis encephalitis virus non-neuroinvasive disease,9635-4
"Streptococcal disease, invasive, Group A",10352-3
"Streptococcal disease, invasive, Group A",11475-1
"Streptococcal disease, invasive, Group A",14475-8
"Streptococcal disease, invasive, Group A",17653-7
"Streptococcal disease, invasive, Group A",17656-0
"Streptococcal disease, invasive, Group A",5036-9
"Streptococcal disease, invasive, Group A",5133-4
"Streptococcal disease, invasive, Group A",5172-2
"Streptococcal disease, invasive, Group A",5173-0
"Streptococcal disease, invasive, Group A",547-0
"Streptococcal disease, invasive, Group A",600-7
"Streptococcal disease, invasive, Group A",606-4
"Streptococcal disease, invasive, Group A",610-6
"Streptococcal disease, invasive, Group A",621-3
"Streptococcal disease, invasive, Group A",626-2
"Streptococcal disease, invasive, Group A",627-0
"Streptococcal disease, invasive, Group A",632-0
"Streptococcal disease, invasive, Group A",635-3
"Streptococcal disease, invasive, Group A",636-1
"Streptococcal disease, invasive, Group A",6463-4
"Streptococcal disease, invasive, Group A",6558-1
"Streptococcal disease, invasive, Group A",6559-9
"Streptococcal disease, invasive, Group B",11475-1
"Streptococcal disease, invasive, Group B",14323-0
"Streptococcal disease, invasive, Group B",14475-8
"Streptococcal disease, invasive, Group B",14476-6
"Streptococcal disease, invasive, Group B",5034-4
"Streptococcal disease, invasive, Group B",586-8
"Streptococcal disease, invasive, Group B",600-7
"Streptococcal disease, invasive, Group B",606-4
"Streptococcal disease, invasive, Group B",610-6
"Streptococcal disease, invasive, Group B",611-4
"Streptococcal disease, invasive, Group B",621-3
"Streptococcal disease, invasive, Group B",627-0
"Streptococcal disease, invasive, Group B",632-0
"Streptococcal disease, invasive, Group B",6463-4
"Streptococcal disease, invasive, Group B",9786-5
"Streptococcus pneumoniae, invasive disease",11086-6
"Streptococcus pneumoniae, invasive disease",11475-1
"Streptococcus pneumoniae, invasive disease",14322-2
"Streptococcus pneumoniae, invasive disease",17652-9
"Streptococcus pneumoniae, invasive disease",17655-2
"Streptococcus pneumoniae, invasive disease",23667-9
"Streptococcus pneumoniae, invasive disease",600-7
"Streptococcus pneumoniae, invasive disease",606-4
"Streptococcus pneumoniae, invasive disease",610-6
"Streptococcus pneumoniae, invasive disease",611-4
"Streptococcus pneumoniae, invasive disease",622-1
"Streptococcus pneumoniae, invasive disease",624-7
"Streptococcus pneumoniae, invasive disease",627-0
"Streptococcus pneumoniae, invasive disease",632-0
"Streptococcus pneumoniae, invasive disease",6463-4
"Streptococcus pneumoniae, invasive disease",6553-2
"Streptococcus pneumoniae, invasive disease",6555-7
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",11086-6
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",11475-1
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",14322-2
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",17652-9
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",17655-2
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",23667-9
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",600-7
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",606-4
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",610-6
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",611-4
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",622-1
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",624-7
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",627-0
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",632-0
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",6463-4
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",6553-2
"Streptococcus pneumoniae, invasive disease, < 5 (drug susceptible)",6555-7
"Syphilis, early latent",11084-1
"Syphilis, early latent",11597-2
"Syphilis, early latent",13288-6
"Syphilis, early latent",17725-3
"Syphilis, early latent",17726-1
"Syphilis, early latent",20507-0
"Syphilis, early latent",20508-8
"Syphilis, early latent",22461-8
"Syphilis, early latent",22587-0
"Syphilis, early latent",22592-0
"Syphilis, early latent",22594-6
"Syphilis, early latent",24110-9
"Syphilis, early latent",24312-1
"Syphilis, early latent",29310-0
"Syphilis, early latent",31146-4
"Syphilis, early latent",31147-2
"Syphilis, early latent",34382-2
"Syphilis, early latent",47238-1
"Syphilis, early latent",5289-4
"Syphilis, early latent",5290-2
"Syphilis, early latent",5291-0
"Syphilis, early latent",5292-8
"Syphilis, early latent",5393-4
"Syphilis, early latent",6561-5
"Syphilis, early latent",6562-3
"Syphilis, early latent",8041-6
"Syphilis, early latent",9826-9
"Syphilis, late latent",11084-1
"Syphilis, late latent",11597-2
"Syphilis, late latent",13288-6
"Syphilis, late latent",17725-3
"Syphilis, late latent",17726-1
"Syphilis, late latent",20507-0
"Syphilis, late latent",20508-8
"Syphilis, late latent",22461-8
"Syphilis, late latent",22587-0
"Syphilis, late latent",22592-0
"Syphilis, late latent",22594-6
"Syphilis, late latent",24110-9
"Syphilis, late latent",24312-1
"Syphilis, late latent",29310-0
"Syphilis, late latent",31146-4
"Syphilis, late latent",31147-2
"Syphilis, late latent",34382-2
"Syphilis, late latent",47238-1
"Syphilis, late latent",5289-4
"Syphilis, late latent",5290-2
"Syphilis, late latent",5291-0
"Syphilis, late latent",5292-8
"Syphilis, late latent",5393-4
"Syphilis, late latent",6561-5
"Syphilis, late latent",6562-3
"Syphilis, late latent",8041-6
"Syphilis, late latent",9826-9
"Syphilis, late with clinical manifestations other than neurosyphilis",11084-1
"Syphilis, late with clinical manifestations other than neurosyphilis",11597-2
"Syphilis, late with clinical manifestations other than neurosyphilis",13288-6
"Syphilis, late with clinical manifestations other than neurosyphilis",17725-3
"Syphilis, late with clinical manifestations other than neurosyphilis",17726-1
"Syphilis, late with clinical manifestations other than neurosyphilis",20507-0
"Syphilis, late with clinical manifestations other than neurosyphilis",20508-8
"Syphilis, late with clinical manifestations other than neurosyphilis",22461-8
"Syphilis, late with clinical manifestations other than neurosyphilis",22587-0
"Syphilis, late with clinical manifestations other than neurosyphilis",22592-0
"Syphilis, late with clinical manifestations other than neurosyphilis",22594-6
"Syphilis, late with clinical manifestations other than neurosyphilis",24110-9
"Syphilis, late with clinical manifestations other than neurosyphilis",24312-1
"Syphilis, late with clinical manifestations other than neurosyphilis",29310-0
"Syphilis, late with clinical manifestations other than neurosyphilis",31146-4
"Syphilis, late with clinical manifestations other than neurosyphilis",31147-2
"Syphilis, late with clinical manifestations other than neurosyphilis",34382-2
"Syphilis, late with clinical manifestations other than neurosyphilis",47238-1
"Syphilis, late with clinical manifestations other than neurosyphilis",5289-4
"Syphilis, late with clinical manifestations other than neurosyphilis",5290-2
"Syphilis, late with clinical manifestations other than neurosyphilis",5291-0
"Syphilis, late with clinical manifestations other than neurosyphilis",5292-8
"Syphilis, late with clinical manifestations other than neurosyphilis",5393-4
"Syphilis, late with clinical manifestations other than neurosyphilis",6561-5
"Syphilis, late with clinical manifestations other than neurosyphilis",6562-3
"Syphilis, late with clinical manifestations other than neurosyphilis",8041-6
"Syphilis, late with clinical manifestations other than neurosyphilis",9826-9
"Syphilis, neurosyphilis",11084-1
"Syphilis, neurosyphilis",11597-2
"Syphilis, neurosyphilis",13288-6
"Syphilis, neurosyphilis",17725-3
"Syphilis, neurosyphilis",17726-1
"Syphilis, neurosyphilis",20507-0
"Syphilis, neurosyphilis",20508-8
"Syphilis, neurosyphilis",22461-8
"Syphilis, neurosyphilis",22587-0
"Syphilis, neurosyphilis",22592-0
"Syphilis, neurosyphilis",22594-6
"Syphilis, neurosyphilis",24110-9
"Syphilis, neurosyphilis",24312-1
"Syphilis, neurosyphilis",29310-0
"Syphilis, neurosyphilis",31146-4
"Syphilis, neurosyphilis",31147-2
"Syphilis, neurosyphilis",34382-2
"Syphilis, neurosyphilis",47238-1
"Syphilis, neurosyphilis",5289-4
"Syphilis, neurosyphilis",5290-2
"Syphilis, neurosyphilis",5291-0
"Syphilis, neurosyphilis",5292-8
"Syphilis, neurosyphilis",5393-4
"Syphilis, neurosyphilis",6561-5
"Syphilis, neurosyphilis",6562-3
"Syphilis, neurosyphilis",8041-6
"Syphilis, neurosyphilis",9826-9
"Syphilis, primary",11084-1
"Syphilis, primary",11597-2
"Syphilis, primary",13288-6
"Syphilis, primary",17725-3
"Syphilis, primary",17726-1
"Syphilis, primary",20507-0
"Syphilis, primary",20508-8
"Syphilis, primary",22461-8
"Syphilis, primary",22587-0
"Syphilis, primary",22592-0
"Syphilis, primary",22594-6
"Syphilis, primary",24110-9
"Syphilis, primary",24312-1
"Syphilis, primary",29310-0
"Syphilis, primary",31146-4
"Syphilis, primary",31147-2
"Syphilis, primary",34382-2
"Syphilis, primary",47238-1
"Syphilis, primary",5289-4
"Syphilis, primary",5290-2
"Syphilis, primary",5291-0
"Syphilis, primary",5292-8
"Syphilis, primary",5393-4
"Syphilis, primary",6561-5
"Syphilis, primary",6562-3
"Syphilis, primary",8041-6
"Syphilis, primary",9826-9
"Syphilis, secondary",11084-1
"Syphilis, secondary",11597-2
"Syphilis, secondary",13288-6
"Syphilis, secondary",17725-3
"Syphilis, secondary",17726-1
"Syphilis, secondary",20507-0
"Syphilis, secondary",20508-8
"Syphilis, secondary",22461-8
"Syphilis, secondary",22587-0
"Syphilis, secondary",22592-0
"Syphilis, secondary",22594-6
"Syphilis, secondary",24110-9
"Syphilis, secondary",24312-1
"Syphilis, secondary",29310-0
"Syphilis, secondary",31146-4
"Syphilis, secondary",31147-2
"Syphilis, secondary",34382-2
"Syphilis, secondary",47238-1
"Syphilis, secondary",5289-4
"Syphilis, secondary",5290-2
"Syphilis, secondary",5291-0
"Syphilis, secondary",5292-8
"Syphilis, secondary",5393-4
"Syphilis, secondary",6561-5
"Syphilis, secondary",6562-3
"Syphilis, secondary",8041-6
"Syphilis, secondary",9826-9
"Syphilis, unknown latent",11084-1
"Syphilis, unknown latent",11597-2
"Syphilis, unknown latent",13288-6
"Syphilis, unknown latent",17725-3
"Syphilis, unknown latent",17726-1
"Syphilis, unknown latent",20507-0
"Syphilis, unknown latent",20508-8
"Syphilis, unknown latent",22461-8
"Syphilis, unknown latent",22587-0
"Syphilis, unknown latent",22592-0
"Syphilis, unknown latent",22594-6
"Syphilis, unknown latent",24110-9
"Syphilis, unknown latent",24312-1
"Syphilis, unknown latent",29310-0
"Syphilis, unknown latent",31146-4
"Syphilis, unknown latent",31147-2
"Syphilis, unknown latent",34382-2
"Syphilis, unknown latent",47238-1
"Syphilis, unknown latent",5289-4
"Syphilis, unknown latent",5290-2
"Syphilis, unknown latent",5291-0
"Syphilis, unknown latent",5292-8
"Syphilis, unknown latent",5393-4
"Syphilis, unknown latent",6561-5
"Syphilis, unknown latent",6562-3
"Syphilis, unknown latent",8041-6
"Syphilis, unknown latent",9826-9
"Tuberculosis, latent  infection (LTBI)",11475-1
"Tuberculosis, latent  infection (LTBI)",11476-9
"Tuberculosis, latent  infection (LTBI)",11545-1
"Tuberculosis, latent  infection (LTBI)",13956-8
"Tuberculosis, latent  infection (LTBI)",14556-5
"Tuberculosis, latent  infection (LTBI)",14557-3
"Tuberculosis, latent  infection (LTBI)",14558-1
"Tuberculosis, latent  infection (LTBI)",14559-9
"Tuberculosis, latent  infection (LTBI)",14560-7
"Tuberculosis, latent  infection (LTBI)",14561-5
"Tuberculosis, latent  infection (LTBI)",14562-3
"Tuberculosis, latent  infection (LTBI)",14974-0
"Tuberculosis, latent  infection (LTBI)",16278-4
"Tuberculosis, latent  infection (LTBI)",17296-5
"Tuberculosis, latent  infection (LTBI)",17297-3
"Tuberculosis, latent  infection (LTBI)",38379-4
"Tuberculosis, latent  infection (LTBI)",40699-1
"Tuberculosis, latent  infection (LTBI)",46245-7
"Tuberculosis, latent  infection (LTBI)",5022-9
"Tuberculosis, latent  infection (LTBI)",5027-8
"Tuberculosis, latent  infection (LTBI)",532-2
"Tuberculosis, latent  infection (LTBI)",533-0
"Tuberculosis, latent  infection (LTBI)",534-8
"Tuberculosis, latent  infection (LTBI)",535-5
"Tuberculosis, latent  infection (LTBI)",536-3
"Tuberculosis, latent  infection (LTBI)",537-1
"Tuberculosis, latent  infection (LTBI)",538-9
"Tuberculosis, latent  infection (LTBI)",539-7
"Tuberculosis, latent  infection (LTBI)",540-5
"Tuberculosis, latent  infection (LTBI)",541-3
"Tuberculosis, latent  infection (LTBI)",54146-6
"Tuberculosis, latent  infection (LTBI)",542-1
"Tuberculosis, latent  infection (LTBI)",543-9
"Tuberculosis, latent  infection (LTBI)",600-7
"Tuberculosis, latent  infection (LTBI)",614-8
"Tuberculosis, latent  infection (LTBI)",627-0
"Tuberculosis, latent  infection (LTBI)",645-2
"Tuberculosis, latent  infection (LTBI)",646-0
"Tuberculosis, latent  infection (LTBI)",6463-4
"Tuberculosis, latent  infection (LTBI)",6656-3
"Tuberculosis, latent  infection (LTBI)",676-7
"Tuberculosis, latent  infection (LTBI)",9823-6
"Tuberculosis, latent  infection (LTBI)",9824-4
"Tuberculosis, latent  infection (LTBI)",9825-1
"Tuberculosis, B1",11475-1
"Tuberculosis, B1",11476-9
"Tuberculosis, B1",11545-1
"Tuberculosis, B1",13956-8
"Tuberculosis, B1",14556-5
"Tuberculosis, B1",14557-3
"Tuberculosis, B1",14558-1
"Tuberculosis, B1",14559-9
"Tuberculosis, B1",14560-7
"Tuberculosis, B1",14561-5
"Tuberculosis, B1",14562-3
"Tuberculosis, B1",14974-0
"Tuberculosis, B1",16278-4
"Tuberculosis, B1",17296-5
"Tuberculosis, B1",17297-3
"Tuberculosis, B1",38379-4
"Tuberculosis, B1",40699-1
"Tuberculosis, B1",46245-7
"Tuberculosis, B1",5022-9
"Tuberculosis, B1",5027-8
"Tuberculosis, B1",532-2
"Tuberculosis, B1",533-0
"Tuberculosis, B1",534-8
"Tuberculosis, B1",535-5
"Tuberculosis, B1",536-3
"Tuberculosis, B1",537-1
"Tuberculosis, B1",538-9
"Tuberculosis, B1",539-7
"Tuberculosis, B1",540-5
"Tuberculosis, B1",541-3
"Tuberculosis, B1",54146-6
"Tuberculosis, B1",542-1
"Tuberculosis, B1",543-9
"Tuberculosis, B1",600-7
"Tuberculosis, B1",614-8
"Tuberculosis, B1",627-0
"Tuberculosis, B1",645-2
"Tuberculosis, B1",646-0
"Tuberculosis, B1",6463-4
"Tuberculosis, B1",6656-3
"Tuberculosis, B1",676-7
"Tuberculosis, B1",9823-6
"Tuberculosis, B1",9824-4
"Tuberculosis, B1",9825-1
"Tuberculosis, B2",11475-1
"Tuberculosis, B2",11476-9
"Tuberculosis, B2",11545-1
"Tuberculosis, B2",13956-8
"Tuberculosis, B2",14556-5
"Tuberculosis, B2",14557-3
"Tuberculosis, B2",14558-1
"Tuberculosis, B2",14559-9
"Tuberculosis, B2",14560-7
"Tuberculosis, B2",14561-5
"Tuberculosis, B2",14562-3
"Tuberculosis, B2",14974-0
"Tuberculosis, B2",16278-4
"Tuberculosis, B2",17296-5
"Tuberculosis, B2",17297-3
"Tuberculosis, B2",38379-4
"Tuberculosis, B2",40699-1
"Tuberculosis, B2",46245-7
"Tuberculosis, B2",5022-9
"Tuberculosis, B2",5027-8
"Tuberculosis, B2",532-2
"Tuberculosis, B2",533-0
"Tuberculosis, B2",534-8
"Tuberculosis, B2",535-5
"Tuberculosis, B2",536-3
"Tuberculosis, B2",537-1
"Tuberculosis, B2",538-9
"Tuberculosis, B2",539-7
"Tuberculosis, B2",540-5
"Tuberculosis, B2",541-3
"Tuberculosis, B2",54146-6
"Tuberculosis, B2",542-1
"Tuberculosis, B2",543-9
"Tuberculosis, B2",600-7
"Tuberculosis, B2",614-8
"Tuberculosis, B2",627-0
"Tuberculosis, B2",645-2
"Tuberculosis, B2",646-0
"Tuberculosis, B2",6463-4
"Tuberculosis, B2",6656-3
"Tuberculosis, B2",676-7
"Tuberculosis, B2",9823-6
"Tuberculosis, B2",9824-4
"Tuberculosis, B2",9825-1
"Tuberculosis, suspect",11475-1
"Tuberculosis, suspect",11476-9
"Tuberculosis, suspect",11545-1
"Tuberculosis, suspect",13956-8
"Tuberculosis, suspect",14556-5
"Tuberculosis, suspect",14557-3
"Tuberculosis, suspect",14558-1
"Tuberculosis, suspect",14559-9
"Tuberculosis, suspect",14560-7
"Tuberculosis, suspect",14561-5
"Tuberculosis, suspect",14562-3
"Tuberculosis, suspect",14974-0
"Tuberculosis, suspect",16278-4
"Tuberculosis, suspect",17296-5
"Tuberculosis, suspect",17297-3
"Tuberculosis, suspect",38379-4
"Tuberculosis, suspect",40699-1
"Tuberculosis, suspect",46245-7
"Tuberculosis, suspect",5022-9
"Tuberculosis, suspect",5027-8
"Tuberculosis, suspect",532-2
"Tuberculosis, suspect",533-0
"Tuberculosis, suspect",534-8
"Tuberculosis, suspect",535-5
"Tuberculosis, suspect",536-3
"Tuberculosis, suspect",537-1
"Tuberculosis, suspect",538-9
"Tuberculosis, suspect",539-7
"Tuberculosis, suspect",540-5
"Tuberculosis, suspect",541-3
"Tuberculosis, suspect",54146-6
"Tuberculosis, suspect",542-1
"Tuberculosis, suspect",543-9
"Tuberculosis, suspect",600-7
"Tuberculosis, suspect",614-8
"Tuberculosis, suspect",627-0
"Tuberculosis, suspect",645-2
"Tuberculosis, suspect",646-0
"Tuberculosis, suspect",6463-4
"Tuberculosis, suspect",6656-3
"Tuberculosis, suspect",676-7
"Tuberculosis, suspect",9823-6
"Tuberculosis, suspect",9824-4
"Tuberculosis, suspect",9825-1
"Tuberculosis, active",11475-1
"Tuberculosis, active",11476-9
"Tuberculosis, active",11545-1
"Tuberculosis, active",13956-8
"Tuberculosis, active",14556-5
"Tuberculosis, active",14557-3
"Tuberculosis, active",14558-1
"Tuberculosis, active",14559-9
"Tuberculosis, active",14560-7
"Tuberculosis, active",14561-5
"Tuberculosis, active",14562-3
"Tuberculosis, active",14974-0
"Tuberculosis, active",16278-4
"Tuberculosis, active",17296-5
"Tuberculosis, active",17297-3
"Tuberculosis, active",38379-4
"Tuberculosis, active",40699-1
"Tuberculosis, active",46245-7
"Tuberculosis, active",5022-9
"Tuberculosis, active",5027-8
"Tuberculosis, active",532-2
"Tuberculosis, active",533-0
"Tuberculosis, active",534-8
"Tuberculosis, active",535-5
"Tuberculosis, active",536-3
"Tuberculosis, active",537-1
"Tuberculosis, active",538-9
"Tuberculosis, active",539-7
"Tuberculosis, active",540-5
"Tuberculosis, active",541-3
"Tuberculosis, active",54146-6
"Tuberculosis, active",542-1
"Tuberculosis, active",543-9
"Tuberculosis, active",600-7
"Tuberculosis, active",614-8
"Tuberculosis, active",627-0
"Tuberculosis, active",645-2
"Tuberculosis, active",646-0
"Tuberculosis, active",6463-4
"Tuberculosis, active",6656-3
"Tuberculosis, active",676-7
"Tuberculosis, active",9823-6
"Tuberculosis, active",9824-4
"Tuberculosis, active",9825-1
TETANUS,11475-1
TETANUS,600-7
TETANUS,628-8
TETANUS,6367-7
Trichinosis,10671-6
Trichinosis,10672-4
Trichinosis,14788-4
Trichinosis,14789-2
Trichinosis,14790-0
Trichinosis,17732-9
Trichinosis,17733-7
Trichinosis,17734-5
Trichinosis,17735-2
Trichinosis,19253-4
Trichinosis,5395-9
Trichinosis,6563-1
Trichinosis,673-4
Trichinosis,8042-4
Trichinosis,8043-2
TULAREMIA,11475-1
TULAREMIA,14209-1
TULAREMIA,16875-7
TULAREMIA,16876-5
TULAREMIA,16877-3
TULAREMIA,16878-1
TULAREMIA,16879-9
TULAREMIA,23125-8
TULAREMIA,33676-8
TULAREMIA,45040-3
TULAREMIA,5166-4
TULAREMIA,5167-2
TULAREMIA,600-7
TULAREMIA,610-6
TULAREMIA,611-4
TULAREMIA,627-0
TULAREMIA,630-4
TULAREMIA,634-6
TULAREMIA,636-1
TULAREMIA,6407-1
TULAREMIA,6408-9
TULAREMIA,6463-4
TULAREMIA,7888-1
TULAREMIA,7889-9
TULAREMIA,7890-7
Typhoid (cases and carriers; caused by Salmonella typhi),5320-7
Typhoid (cases and carriers; caused by Salmonella typhi),5322-3
Vancomycin-resistant Staphylococcus aureus (VRSA),610-6
Vancomycin-intermediate Staphylococcus aureus (VISA),610-6
Venezuelan equine encephalitis virus neuroinvasive disease,10896-9
Venezuelan equine encephalitis virus neuroinvasive disease,10897-7
Venezuelan equine encephalitis virus neuroinvasive disease,10898-5
Venezuelan equine encephalitis virus neuroinvasive disease,10899-3
Venezuelan equine encephalitis virus neuroinvasive disease,10904-1
Venezuelan equine encephalitis virus neuroinvasive disease,10905-8
Venezuelan equine encephalitis virus neuroinvasive disease,10906-6
Venezuelan equine encephalitis virus neuroinvasive disease,10907-4
Venezuelan equine encephalitis virus neuroinvasive disease,13228-2
Venezuelan equine encephalitis virus neuroinvasive disease,13229-0
Venezuelan equine encephalitis virus neuroinvasive disease,13230-8
Venezuelan equine encephalitis virus neuroinvasive disease,13231-6
Venezuelan equine encephalitis virus neuroinvasive disease,17036-5
Venezuelan equine encephalitis virus neuroinvasive disease,17037-3
Venezuelan equine encephalitis virus neuroinvasive disease,17038-1
Venezuelan equine encephalitis virus neuroinvasive disease,17039-9
Venezuelan equine encephalitis virus neuroinvasive disease,17769-1
Venezuelan equine encephalitis virus neuroinvasive disease,17770-9
Venezuelan equine encephalitis virus neuroinvasive disease,21509-5
Venezuelan equine encephalitis virus neuroinvasive disease,21510-3
Venezuelan equine encephalitis virus neuroinvasive disease,23046-6
Venezuelan equine encephalitis virus neuroinvasive disease,23991-3
Venezuelan equine encephalitis virus neuroinvasive disease,23992-1
Venezuelan equine encephalitis virus neuroinvasive disease,29783-8
Venezuelan equine encephalitis virus neuroinvasive disease,29785-3
Venezuelan equine encephalitis virus neuroinvasive disease,29789-5
Venezuelan equine encephalitis virus neuroinvasive disease,30174-7
Venezuelan equine encephalitis virus neuroinvasive disease,30175-4
Venezuelan equine encephalitis virus neuroinvasive disease,30176-2
Venezuelan equine encephalitis virus neuroinvasive disease,30177-0
Venezuelan equine encephalitis virus neuroinvasive disease,30179-6
Venezuelan equine encephalitis virus neuroinvasive disease,33295-7
Venezuelan equine encephalitis virus neuroinvasive disease,34450-7
Venezuelan equine encephalitis virus neuroinvasive disease,37983-4
Venezuelan equine encephalitis virus neuroinvasive disease,37984-2
Venezuelan equine encephalitis virus neuroinvasive disease,41878-0
Venezuelan equine encephalitis virus neuroinvasive disease,5073-2
Venezuelan equine encephalitis virus neuroinvasive disease,5134-2
Venezuelan equine encephalitis virus neuroinvasive disease,5406-4
Venezuelan equine encephalitis virus neuroinvasive disease,5883-4
Venezuelan equine encephalitis virus neuroinvasive disease,5884-2
Venezuelan equine encephalitis virus neuroinvasive disease,5888-3
Venezuelan equine encephalitis virus neuroinvasive disease,6309-9
Venezuelan equine encephalitis virus neuroinvasive disease,6310-7
Venezuelan equine encephalitis virus neuroinvasive disease,6383-4
Venezuelan equine encephalitis virus neuroinvasive disease,6388-3
Venezuelan equine encephalitis virus neuroinvasive disease,6389-1
Venezuelan equine encephalitis virus neuroinvasive disease,6549-0
Venezuelan equine encephalitis virus neuroinvasive disease,6585-4
Venezuelan equine encephalitis virus neuroinvasive disease,6586-2
Venezuelan equine encephalitis virus neuroinvasive disease,6812-2
Venezuelan equine encephalitis virus neuroinvasive disease,6957-5
Venezuelan equine encephalitis virus neuroinvasive disease,6958-3
Venezuelan equine encephalitis virus neuroinvasive disease,7860-0
Venezuelan equine encephalitis virus neuroinvasive disease,7861-8
Venezuelan equine encephalitis virus neuroinvasive disease,7938-4
Venezuelan equine encephalitis virus neuroinvasive disease,7940-0
Venezuelan equine encephalitis virus neuroinvasive disease,7941-8
Venezuelan equine encephalitis virus neuroinvasive disease,8016-8
Venezuelan equine encephalitis virus neuroinvasive disease,8017-6
Venezuelan equine encephalitis virus neuroinvasive disease,8021-8
Venezuelan equine encephalitis virus neuroinvasive disease,8023-4
Venezuelan equine encephalitis virus neuroinvasive disease,8025-9
Venezuelan equine encephalitis virus neuroinvasive disease,8052-3
Venezuelan equine encephalitis virus neuroinvasive disease,8053-1
Venezuelan equine encephalitis virus neuroinvasive disease,9314-6
Venezuelan equine encephalitis virus neuroinvasive disease,9315-3
Venezuelan equine encephalitis virus neuroinvasive disease,9316-1
Venezuelan equine encephalitis virus neuroinvasive disease,9539-8
Venezuelan equine encephalitis virus neuroinvasive disease,9540-6
Venezuelan equine encephalitis virus neuroinvasive disease,9577-8
Venezuelan equine encephalitis virus neuroinvasive disease,9634-7
Venezuelan equine encephalitis virus neuroinvasive disease,9635-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,10896-9
Venezuelan equine encephalitis virus non-neuroinvasive disease,10897-7
Venezuelan equine encephalitis virus non-neuroinvasive disease,10898-5
Venezuelan equine encephalitis virus non-neuroinvasive disease,10899-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,10904-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,10905-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,10906-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,10907-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,13228-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,13229-0
Venezuelan equine encephalitis virus non-neuroinvasive disease,13230-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,13231-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,17036-5
Venezuelan equine encephalitis virus non-neuroinvasive disease,17037-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,17038-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,17039-9
Venezuelan equine encephalitis virus non-neuroinvasive disease,17769-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,17770-9
Venezuelan equine encephalitis virus non-neuroinvasive disease,21509-5
Venezuelan equine encephalitis virus non-neuroinvasive disease,21510-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,23046-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,23991-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,23992-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,29783-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,29785-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,29789-5
Venezuelan equine encephalitis virus non-neuroinvasive disease,30174-7
Venezuelan equine encephalitis virus non-neuroinvasive disease,30175-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,30176-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,30177-0
Venezuelan equine encephalitis virus non-neuroinvasive disease,30179-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,33295-7
Venezuelan equine encephalitis virus non-neuroinvasive disease,34450-7
Venezuelan equine encephalitis virus non-neuroinvasive disease,37983-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,37984-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,41878-0
Venezuelan equine encephalitis virus non-neuroinvasive disease,5073-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,5134-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,5406-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,5883-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,5884-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,5888-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,6309-9
Venezuelan equine encephalitis virus non-neuroinvasive disease,6310-7
Venezuelan equine encephalitis virus non-neuroinvasive disease,6383-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,6388-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,6389-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,6549-0
Venezuelan equine encephalitis virus non-neuroinvasive disease,6585-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,6586-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,6812-2
Venezuelan equine encephalitis virus non-neuroinvasive disease,6957-5
Venezuelan equine encephalitis virus non-neuroinvasive disease,6958-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,7860-0
Venezuelan equine encephalitis virus non-neuroinvasive disease,7861-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,7938-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,7940-0
Venezuelan equine encephalitis virus non-neuroinvasive disease,7941-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,8016-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,8017-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,8021-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,8023-4
Venezuelan equine encephalitis virus non-neuroinvasive disease,8025-9
Venezuelan equine encephalitis virus non-neuroinvasive disease,8052-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,8053-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,9314-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,9315-3
Venezuelan equine encephalitis virus non-neuroinvasive disease,9316-1
Venezuelan equine encephalitis virus non-neuroinvasive disease,9539-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,9540-6
Venezuelan equine encephalitis virus non-neuroinvasive disease,9577-8
Venezuelan equine encephalitis virus non-neuroinvasive disease,9634-7
Venezuelan equine encephalitis virus non-neuroinvasive disease,9635-4
Vibriosis (non-cholera Vibrio species infections),11475-1
Vibriosis (non-cholera Vibrio species infections),600-7
Vibriosis (non-cholera Vibrio species infections),625-4
Vibriosis (non-cholera Vibrio species infections),6579-7
Vibriosis (non-cholera Vibrio species infections),6581-3
Western Equine encephalitis virus neuroinvasive disease,10896-9
Western Equine encephalitis virus neuroinvasive disease,10897-7
Western Equine encephalitis virus neuroinvasive disease,10898-5
Western Equine encephalitis virus neuroinvasive disease,10899-3
Western Equine encephalitis virus neuroinvasive disease,10904-1
Western Equine encephalitis virus neuroinvasive disease,10905-8
Western Equine encephalitis virus neuroinvasive disease,10906-6
Western Equine encephalitis virus neuroinvasive disease,10907-4
Western Equine encephalitis virus neuroinvasive disease,13228-2
Western Equine encephalitis virus neuroinvasive disease,13229-0
Western Equine encephalitis virus neuroinvasive disease,13230-8
Western Equine encephalitis virus neuroinvasive disease,13231-6
Western Equine encephalitis virus neuroinvasive disease,17036-5
Western Equine encephalitis virus neuroinvasive disease,17037-3
Western Equine encephalitis virus neuroinvasive disease,17038-1
Western Equine encephalitis virus neuroinvasive disease,17039-9
Western Equine encephalitis virus neuroinvasive disease,17769-1
Western Equine encephalitis virus neuroinvasive disease,17770-9
Western Equine encephalitis virus neuroinvasive disease,21509-5
Western Equine encephalitis virus neuroinvasive disease,21510-3
Western Equine encephalitis virus neuroinvasive disease,23046-6
Western Equine encephalitis virus neuroinvasive disease,23991-3
Western Equine encephalitis virus neuroinvasive disease,23992-1
Western Equine encephalitis virus neuroinvasive disease,29783-8
Western Equine encephalitis virus neuroinvasive disease,29785-3
Western Equine encephalitis virus neuroinvasive disease,29789-5
Western Equine encephalitis virus neuroinvasive disease,30174-7
Western Equine encephalitis virus neuroinvasive disease,30175-4
Western Equine encephalitis virus neuroinvasive disease,30176-2
Western Equine encephalitis virus neuroinvasive disease,30177-0
Western Equine encephalitis virus neuroinvasive disease,30179-6
Western Equine encephalitis virus neuroinvasive disease,33295-7
Western Equine encephalitis virus neuroinvasive disease,34450-7
Western Equine encephalitis virus neuroinvasive disease,37983-4
Western Equine encephalitis virus neuroinvasive disease,37984-2
Western Equine encephalitis virus neuroinvasive disease,41878-0
Western Equine encephalitis virus neuroinvasive disease,5073-2
Western Equine encephalitis virus neuroinvasive disease,5134-2
Western Equine encephalitis virus neuroinvasive disease,5406-4
Western Equine encephalitis virus neuroinvasive disease,5883-4
Western Equine encephalitis virus neuroinvasive disease,5884-2
Western Equine encephalitis virus neuroinvasive disease,5888-3
Western Equine encephalitis virus neuroinvasive disease,6309-9
Western Equine encephalitis virus neuroinvasive disease,6310-7
Western Equine encephalitis virus neuroinvasive disease,6383-4
Western Equine encephalitis virus neuroinvasive disease,6388-3
Western Equine encephalitis virus neuroinvasive disease,6389-1
Western Equine encephalitis virus neuroinvasive disease,6549-0
Western Equine encephalitis virus neuroinvasive disease,6585-4
Western Equine encephalitis virus neuroinvasive disease,6586-2
Western Equine encephalitis virus neuroinvasive disease,6812-2
Western Equine encephalitis virus neuroinvasive disease,6957-5
Western Equine encephalitis virus neuroinvasive disease,6958-3
Western Equine encephalitis virus neuroinvasive disease,7860-0
Western Equine encephalitis virus neuroinvasive disease,7861-8
Western Equine encephalitis virus neuroinvasive disease,7938-4
Western Equine encephalitis virus neuroinvasive disease,7940-0
Western Equine encephalitis virus neuroinvasive disease,7941-8
Western Equine encephalitis virus neuroinvasive disease,8016-8
Western Equine encephalitis virus neuroinvasive disease,8017-6
Western Equine encephalitis virus neuroinvasive disease,8021-8
Western Equine encephalitis virus neuroinvasive disease,8023-4
Western Equine encephalitis virus neuroinvasive disease,8025-9
Western Equine encephalitis virus neuroinvasive disease,8052-3
Western Equine encephalitis virus neuroinvasive disease,8053-1
Western Equine encephalitis virus neuroinvasive disease,9314-6
Western Equine encephalitis virus neuroinvasive disease,9315-3
Western Equine encephalitis virus neuroinvasive disease,9316-1
Western Equine encephalitis virus neuroinvasive disease,9539-8
Western Equine encephalitis virus neuroinvasive disease,9540-6
Western Equine encephalitis virus neuroinvasive disease,9577-8
Western Equine encephalitis virus neuroinvasive disease,9634-7
Western Equine encephalitis virus neuroinvasive disease,9635-4
Western Equine encephalitis virus non-neuroinvasive disease,10896-9
Western Equine encephalitis virus non-neuroinvasive disease,10897-7
Western Equine encephalitis virus non-neuroinvasive disease,10898-5
Western Equine encephalitis virus non-neuroinvasive disease,10899-3
Western Equine encephalitis virus non-neuroinvasive disease,10904-1
Western Equine encephalitis virus non-neuroinvasive disease,10905-8
Western Equine encephalitis virus non-neuroinvasive disease,10906-6
Western Equine encephalitis virus non-neuroinvasive disease,10907-4
Western Equine encephalitis virus non-neuroinvasive disease,13228-2
Western Equine encephalitis virus non-neuroinvasive disease,13229-0
Western Equine encephalitis virus non-neuroinvasive disease,13230-8
Western Equine encephalitis virus non-neuroinvasive disease,13231-6
Western Equine encephalitis virus non-neuroinvasive disease,17036-5
Western Equine encephalitis virus non-neuroinvasive disease,17037-3
Western Equine encephalitis virus non-neuroinvasive disease,17038-1
Western Equine encephalitis virus non-neuroinvasive disease,17039-9
Western Equine encephalitis virus non-neuroinvasive disease,17769-1
Western Equine encephalitis virus non-neuroinvasive disease,17770-9
Western Equine encephalitis virus non-neuroinvasive disease,21509-5
Western Equine encephalitis virus non-neuroinvasive disease,21510-3
Western Equine encephalitis virus non-neuroinvasive disease,23046-6
Western Equine encephalitis virus non-neuroinvasive disease,23991-3
Western Equine encephalitis virus non-neuroinvasive disease,23992-1
Western Equine encephalitis virus non-neuroinvasive disease,29783-8
Western Equine encephalitis virus non-neuroinvasive disease,29785-3
Western Equine encephalitis virus non-neuroinvasive disease,29789-5
Western Equine encephalitis virus non-neuroinvasive disease,30174-7
Western Equine encephalitis virus non-neuroinvasive disease,30175-4
Western Equine encephalitis virus non-neuroinvasive disease,30176-2
Western Equine encephalitis virus non-neuroinvasive disease,30177-0
Western Equine encephalitis virus non-neuroinvasive disease,30179-6
Western Equine encephalitis virus non-neuroinvasive disease,33295-7
Western Equine encephalitis virus non-neuroinvasive disease,34450-7
Western Equine encephalitis virus non-neuroinvasive disease,37983-4
Western Equine encephalitis virus non-neuroinvasive disease,37984-2
Western Equine encephalitis virus non-neuroinvasive disease,41878-0
Western Equine encephalitis virus non-neuroinvasive disease,5073-2
Western Equine encephalitis virus non-neuroinvasive disease,5134-2
Western Equine encephalitis virus non-neuroinvasive disease,5406-4
Western Equine encephalitis virus non-neuroinvasive disease,5883-4
Western Equine encephalitis virus non-neuroinvasive disease,5884-2
Western Equine encephalitis virus non-neuroinvasive disease,5888-3
Western Equine encephalitis virus non-neuroinvasive disease,6309-9
Western Equine encephalitis virus non-neuroinvasive disease,6310-7
Western Equine encephalitis virus non-neuroinvasive disease,6383-4
Western Equine encephalitis virus non-neuroinvasive disease,6388-3
Western Equine encephalitis virus non-neuroinvasive disease,6389-1
Western Equine encephalitis virus non-neuroinvasive disease,6549-0
Western Equine encephalitis virus non-neuroinvasive disease,6585-4
Western Equine encephalitis virus non-neuroinvasive disease,6586-2
Western Equine encephalitis virus non-neuroinvasive disease,6812-2
Western Equine encephalitis virus non-neuroinvasive disease,6957-5
Western Equine encephalitis virus non-neuroinvasive disease,6958-3
Western Equine encephalitis virus non-neuroinvasive disease,7860-0
Western Equine encephalitis virus non-neuroinvasive disease,7861-8
Western Equine encephalitis virus non-neuroinvasive disease,7938-4
Western Equine encephalitis virus non-neuroinvasive disease,7940-0
Western Equine encephalitis virus non-neuroinvasive disease,7941-8
Western Equine encephalitis virus non-neuroinvasive disease,8016-8
Western Equine encephalitis virus non-neuroinvasive disease,8017-6
Western Equine encephalitis virus non-neuroinvasive disease,8021-8
Western Equine encephalitis virus non-neuroinvasive disease,8023-4
Western Equine encephalitis virus non-neuroinvasive disease,8025-9
Western Equine encephalitis virus non-neuroinvasive disease,8052-3
Western Equine encephalitis virus non-neuroinvasive disease,8053-1
Western Equine encephalitis virus non-neuroinvasive disease,9314-6
Western Equine encephalitis virus non-neuroinvasive disease,9315-3
Western Equine encephalitis virus non-neuroinvasive disease,9316-1
Western Equine encephalitis virus non-neuroinvasive disease,9539-8
Western Equine encephalitis virus non-neuroinvasive disease,9540-6
Western Equine encephalitis virus non-neuroinvasive disease,9577-8
Western Equine encephalitis virus non-neuroinvasive disease,9634-7
Western Equine encephalitis virus non-neuroinvasive disease,9635-4
West Nile virus neuroinvasive disease,29535-2
West Nile virus neuroinvasive disease,29536-0
West Nile virus neuroinvasive disease,29537-8
West Nile virus neuroinvasive disease,29538-6
West Nile virus neuroinvasive disease,29566-7
West Nile virus neuroinvasive disease,29567-5
West Nile virus neuroinvasive disease,29568-3
West Nile virus neuroinvasive disease,29569-1
West Nile virus neuroinvasive disease,29778-8
West Nile virus neuroinvasive disease,30178-8
West Nile virus neuroinvasive disease,32361-8
West Nile virus neuroinvasive disease,36896-9
West Nile virus neuroinvasive disease,36897-7
West Nile virus neuroinvasive disease,36898-5
West Nile virus neuroinvasive disease,37985-9
West Nile virus neuroinvasive disease,38997-3
West Nile virus neuroinvasive disease,39572-3
West Nile virus non-neuroinvasive disease,29535-2
West Nile virus non-neuroinvasive disease,29536-0
West Nile virus non-neuroinvasive disease,29537-8
West Nile virus non-neuroinvasive disease,29538-6
West Nile virus non-neuroinvasive disease,29566-7
West Nile virus non-neuroinvasive disease,29567-5
West Nile virus non-neuroinvasive disease,29568-3
West Nile virus non-neuroinvasive disease,29569-1
West Nile virus non-neuroinvasive disease,29778-8
West Nile virus non-neuroinvasive disease,30178-8
West Nile virus non-neuroinvasive disease,32361-8
West Nile virus non-neuroinvasive disease,36896-9
West Nile virus non-neuroinvasive disease,36897-7
West Nile virus non-neuroinvasive disease,36898-5
West Nile virus non-neuroinvasive disease,37985-9
West Nile virus non-neuroinvasive disease,38997-3
West Nile virus non-neuroinvasive disease,39572-3
YELLOW FEVER,5883-4
YELLOW FEVER,6587-0
YELLOW FEVER,6588-8
YELLOW FEVER,6589-6
YELLOW FEVER,6590-4
YELLOW FEVER,6591-2
YELLOW FEVER,6592-0
YELLOW FEVER,6593-8
YELLOW FEVER,8054-9
YELLOW FEVER,8055-6
YELLOW FEVER,8056-4
YELLOW FEVER,8057-2
YERSINIOSIS,11475-1
YERSINIOSIS,41400-3
YERSINIOSIS,41401-1
YERSINIOSIS,48410-5
YERSINIOSIS,5407-2
YERSINIOSIS,5408-0
YERSINIOSIS,5409-8
YERSINIOSIS,5410-6
YERSINIOSIS,625-4
YERSINIOSIS,6959-1
YERSINIOSIS,6960-9
YERSINIOSIS,6961-7
YERSINIOSIS,6962-5
YERSINIOSIS,6963-3
YERSINIOSIS,6964-1
YERSINIOSIS,6965-8
YERSINIOSIS,6966-6
YERSINIOSIS,6967-4
YERSINIOSIS,701-3
CSV
  end
end