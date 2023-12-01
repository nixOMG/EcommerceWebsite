<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/include/header.jsp" />
	<!-- Close Header -->

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form action="shop" method="get" class="modal-content modal-body border-0 p-0">
				<input type="hidden" name="action" value="search-product"/>
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch" name="productName" placeholder="Search ...">
					<button type="submit" class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
<!-- End header -->

<section style="background-color: #eee;">
  <div class="container py-5">

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <c:if test="${not empty sessionScope.loggedInUser}">
		        	<h5 class="my-3">${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</h5>
   			</c:if>
            
            <p class="text-muted mb-1">Full Stack Developer</p>
            <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
            <div class="d-flex justify-content-center mb-2">
              <button type="button" class="btn btn-primary">Follow</button>
              <button type="button" class="btn btn-outline-primary ms-1">Message</button>
            </div>
          </div>
        </div>
        
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
              <c:if test="${not empty sessionScope.loggedInUser}">
		        <p class="text-muted mb-0">${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</p>
	    	</c:if>
                
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <c:if test="${not empty sessionScope.loggedInUser}">
		        	<p class="text-muted mb-0">${sessionScope.loggedInUser.email}</p>
	    		</c:if>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <c:if test="${not empty sessionScope.loggedInUser}">
		        	<p class="text-muted mb-0">${sessionScope.loggedInUser.phone}</p>
	    		</c:if>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <c:if test="${not empty sessionScope.loggedInUser}">
		        	<p class="text-muted mb-0">${sessionScope.loggedInUser.address}</p>
	    		</c:if>
              </div>
            </div>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</section>


<!-- Start Footer -->
	<jsp:include page="/include/footer.jsp" />
	<!-- End Footer -->
	
	<!-- Start Script -->
	<script src="assets/js/jquery-1.11.0.min.js"></script>
	<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/templatemo.js"></script>
	<script src="assets/js/custom.js"></script>
	<!-- End Script -->

</body>
</html>