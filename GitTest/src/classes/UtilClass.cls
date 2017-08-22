public class UtilClass {
    
    public static integer iAdd(integer a, integer b){
        return (a+b);
       
    }
    
    public static integer iSub(integer a, integer b){
        return (a-b);
        
    }
    
    public static integer iMul(integer a, integer b){
        return (a*b);
        
    }
    
    public static boolean UpdateApprovalInfo(Opportunity Opp){
        boolean bIsSuccess=false;
        try{
            map<string,string> ApprovalData = getMapApprovalInfo();
            if(Opp.Product_Type__c!=null){
                if(Opp.Product_Type__c=='Hardware'){
                    opp.Approval_Level_1__c = ApprovalData.get('Level one Approval'+ opp.Product_type__c);
                    opp.Approval_Level_2__c = ApprovalData.get('level two approval' + opp.Product_type__c);
                    
                }
            }
            bIsSuccess=true;
            
            
        }catch(Exception ex){
            bIsSuccess=false;
        }
        return bIsSuccess;
    }
    
    public static Map<string , string> getMapApprovalInfo(){
        Map<String , string> MapProductTypeWiseUser=new Map<String, string>();

        for(ApprovalInfo__c App:ApprovalInfo__c.getAll().values()){
            
            string strKey='';
            string strUserId='';
            strKey=App.Name + App.Product_Type__c;
            strUserId=App.UserId__c;
            MapProductTypeWiseUser.put(strKey,strUserId);
        }
		Return MapProductTypeWiseUser;
    }
    
    public static Map<string,double> getDivisionWisePercent(){
        Map<string,double> MetaDataRecord = new Map<string,double>();
        
        for(DivisionCommission__mdt Rec: [Select DeveloperName, Commission__c from DivisionCommission__mdt]){
            
            MetaDataRecord.put(Rec.DeveloperName,Rec.Commission__c);
        }
        return MetaDataRecord;
    }
    
    public static void UpdateOppComm(Opportunity opp){
        
        Opportunity tempOpp = [select id, name, ownerid, commission__c from opportunity limit 1];
        
        
        
        
    }
        
    
}