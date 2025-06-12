package connection;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

public class DeleteDocument {
	public static void main(String args[]){
		// Creating a Mongo client 
	    MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
	    MongoDatabase database = mongoClient.getDatabase("myDb");

	    // Get the collection
	    MongoCollection<Document> collection = database.getCollection("sampleCollection");
	    
	    // Delete one and Find all documents
	    collection.deleteOne(Filters.eq("First_Name","Radhika"));
	    System.out.println("Document Deleted");
	    System.out.println("***Document***");
	    
	    //Select a particular document
	    FindIterable<Document> documents = collection.find();
	    
	    for(Document document : documents){
	    	System.out.println(document);
	    }                                                                      
	    
	    //Delete up on condition
	    MongoDatabase database2 = mongoClient.getDatabase("vit");     
	    
	 // Get the collection
	    MongoCollection<Document> collection2 = database2.getCollection("sales");
	 // Delete many and Find all documents
	    collection2.deleteMany(Filters.eq("item","Cappuccino"));
	    System.out.println("Document Deleted");
	    System.out.println("***Document***");
	    
	  //Select a particular document
	    FindIterable<Document> documents2 = collection2.find();
	    
	    for(Document document : documents2){
	    	System.out.println(document);
	    }
	}
}
