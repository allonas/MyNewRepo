
package io.buildup.actionstest20151127112013.ds;
import java.util.List;
import retrofit.Callback;
import retrofit.http.GET;
import retrofit.http.Query;
import retrofit.http.POST;
import retrofit.http.Body;
import retrofit.http.DELETE;
import retrofit.http.Path;
import retrofit.http.PUT;

public interface NotNullableDSServiceRest{

	@GET("/app/56bc883d228cdc0300318742/r/notNullableDS")
	void queryNotNullableDSItem(
		@Query("skip") String skip,
		@Query("limit") String limit,
		@Query("conditions") String conditions,
		@Query("sort") String sort,
		@Query("select") String select,
		@Query("populate") String populate,
		Callback<List<NotNullableDSItem>> cb);

	@GET("/app/56bc883d228cdc0300318742/r/notNullableDS/{id}")
	void getNotNullableDSItemById(@Path("id") String id, Callback<NotNullableDSItem> cb);

	@DELETE("/app/56bc883d228cdc0300318742/r/notNullableDS/{id}")
  void deleteNotNullableDSItemById(@Path("id") String id, Callback<NotNullableDSItem> cb);

  @POST("/app/56bc883d228cdc0300318742/r/notNullableDS/deleteByIds")
  void deleteByIds(@Body List<String> ids, Callback<List<NotNullableDSItem>> cb);

  @POST("/app/56bc883d228cdc0300318742/r/notNullableDS")
  void createNotNullableDSItem(@Body NotNullableDSItem item, Callback<NotNullableDSItem> cb);

  @PUT("/app/56bc883d228cdc0300318742/r/notNullableDS/{id}")
  void updateNotNullableDSItem(@Path("id") String id, @Body NotNullableDSItem item, Callback<NotNullableDSItem> cb);

  @GET("/app/56bc883d228cdc0300318742/r/notNullableDS")
  void distinct(
        @Query("distinct") String colName,
        @Query("conditions") String conditions,
        Callback<List<String>> cb);
}
