
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

public interface NullableDSServiceRest{

	@GET("/app/56bc883d228cdc0300318742/r/nullableDS")
	void queryNullableDSItem(
		@Query("skip") String skip,
		@Query("limit") String limit,
		@Query("conditions") String conditions,
		@Query("sort") String sort,
		@Query("select") String select,
		@Query("populate") String populate,
		Callback<List<NullableDSItem>> cb);

	@GET("/app/56bc883d228cdc0300318742/r/nullableDS/{id}")
	void getNullableDSItemById(@Path("id") String id, Callback<NullableDSItem> cb);

	@DELETE("/app/56bc883d228cdc0300318742/r/nullableDS/{id}")
  void deleteNullableDSItemById(@Path("id") String id, Callback<NullableDSItem> cb);

  @POST("/app/56bc883d228cdc0300318742/r/nullableDS/deleteByIds")
  void deleteByIds(@Body List<String> ids, Callback<List<NullableDSItem>> cb);

  @POST("/app/56bc883d228cdc0300318742/r/nullableDS")
  void createNullableDSItem(@Body NullableDSItem item, Callback<NullableDSItem> cb);

  @PUT("/app/56bc883d228cdc0300318742/r/nullableDS/{id}")
  void updateNullableDSItem(@Path("id") String id, @Body NullableDSItem item, Callback<NullableDSItem> cb);

  @GET("/app/56bc883d228cdc0300318742/r/nullableDS")
  void distinct(
        @Query("distinct") String colName,
        @Query("conditions") String conditions,
        Callback<List<String>> cb);
}
