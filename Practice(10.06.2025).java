package connection;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class Practice {
	public static void main(String args[]){
		// Creating a Mongo client 
	    MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
	    MongoDatabase database = mongoClient.getDatabase("vit");

	    // Get the collection
	    MongoCollection<Document> collection = database.getCollection("sales");
	    
	    // GET THE EVEN POSITIONED DOCUMENTS ONLY 
	    
	  //Select a particular document
	    FindIterable<Document> documents = collection.find();
	    
	    int index=0;
        for (Document doc : documents) {
            if (index % 2 == 0) {
                System.out.println("Remaining Document: " + doc);
            }
            index++;
        }
	}
}
