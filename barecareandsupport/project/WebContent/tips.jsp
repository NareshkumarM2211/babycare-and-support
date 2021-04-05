<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
	<c:set var="x" value="0"></c:set>
	<c:forEach items="${cartlist }" var="i">
		<c:set var="x" value="${x+1 }"></c:set>
	</c:forEach>

	<header>
		<h1 style="color:white">
			Babycare
		</h1>
		<nav>
			<ul>
			    <li><a style="color:white"href="Controller?page=home">Home</a></li>
			    
				<li><a style="color:blue" href="tips.jsp">Tips</a></li>
				<li><a style="color:white" href="Controller?page=product">Product</a></li>
				<li><a style="color:white" href="viewnames.jsp">Names</a></li>
				<li><a style="color:white" href="Controller?page=product">Appointment</a></li>
				
				
				<c:choose>
					<c:when test="${session == null}">
						<li><a style="color:white" href="Controller?page=login">Login</a></li>
						<li><a style="color:white" href="Controller?page=sign-up">Sign-up</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a  href="Controller?page=logout" style="color: #F24638;">Logout</a></li>
						<li><a style="color:white" href="#">My Account(<c:out value="${username }"></c:out>)</a></li>
					</c:when>
				</c:choose>
				<li><a style="color:white" href="Controller?page=showcart">cart(<c:out value="${x}"/>)</a></li>
			</ul>
		</nav>
	</header>
	<html>		
	
  <link rel="stylesheet" href="resources/bootstrap.min.css"/>
  <style>
     
     div.box{width:250px;border:1px solid pink;padding:20px;float:left}     
  </style>
  
<h2>1.Holding</h2>

<h4>Your new-born may feel fragile and delicate to you, but do not 
be afraid to touch, handle or hold her! In fact, studies show that 
babies who are held for more than 2 hours per day thrive better and cry less.
 No baby care guide can be complete without this valuable advice!
  Know about the various baby massage benefits.
 Remember: Your newborn neck muscles are not yet developed,
  so you will need to support her head whenever you pick her up.
   You should also support her head against your shoulder or with
    your opposite hand while carrying her.</h4>
<h2>2.How to Choose Products for Your Newborn</h2>

<h4>Parenting tips for babies are incomplete without
 guidelines on how to choose the right baby products. An ideal baby product should
</h4>
<h4> i).Safe, gentle, mild: Safety is an understatement when
 you are dealing with skin as delicate as that of your babies.
  It is expected that any product which claims to be specifically
 a baby product would be safe for baby skin.</h4>
<h4>ii).It should be tested for allergies: Allergens are widespread which 
means that no substance can be said to be entirely free of
 any allergic reactions. However, for a product to be considered
  as a baby product, it must be tested and have proved negative 
  for any allergic tendencies.
 In other words it must be Clinically Proven Mild.</h4>
<h4>iii).Diaper Change</h4>
<h4>Many first-time parents are surprised at how many diapers their baby 
goes through in a day. To make life easier for yourself, store plenty of
 diapers before you bring your baby home. It is also helpful to learn how
  to change your babys diaper ahead of time (and even practice!).
Also, be prepared for nappy rashes as most children aged 0-2 years 
develop a diaper rash in some way. When you see the first sign of 
redness, apply a safe yet effective zinc oxide based cream on the diaper area.
To keep your babys diaper area dry, apply a baby diaper rash powder at every 
diaper change. It repels moisture and reduces friction on the skin, thereby
 providing complete protection.</h4>


<h2>4.Comforting</h2>

<h4>Most babies cry for an average of 2 hours a day during the first 3 months.
 As shocking as it may be, it is also normal.
To comfort your baby, first try to determine the cause of 
your babys discomfort. Is your baby hungry? Does she have gas?
 Does her diaper need changing? Is it time for a nap? Is your baby 
 over-stimulated by noise, lights or activity? A host of simple tips
  on how to handle a newborn baby can help you manage the situation with 
  minimal panic. Your natural motherly instincts will also come into play
   without you even noticing!
To help soothe a sleepy or over-stimulated baby, hold her on your 
shoulder while gently rocking her. Sing or speak softly to your
 baby reassure her with your calm voice. Rubbing your baby back as you 
 do so can also help calm her. Try different positions to find one thats 
 comfortable for both of you.
Something else to consider: Your baby does not have much mobility in the
 first few weeks and may cry for help if she is lying uncomfortably in the crib. 
 You can help your baby get comfortable by gently shifting her position.
 For safety though, always place your baby on her back while sleeping.
</h4>

<h2>5.Feeding</h2>

<h4>Many healthcare professionals agree that nothing is better for your 
newborn baby than breast milk. Nutritionally speaking, it is tailor-made
 for your infant. Unfortunately, sometimes mothers cannot breastfeed 
 due to medical problems or other special circumstances. Consult your
  paediatrician on how to feed your newborn baby most effectively.
No matter how you decide to feed your baby, always be sure to hold
 your baby while feeding. The cuddling that comes with nursing and 
 feeding helps in building a strong, loving bond between you and your baby.</h4>

<h2>6.Freshening</h2>

<h4>Freshening your little one can be a great bonding 
experience after every bath and diaper change.
 You can use JOHNSONS Baby Powder, that protects your babys
  skin from excess moisture and leaves it soft and smooth. 
  It eliminates friction while keeping skin cool and comfortable.
 Trust us, it is a classic!</p>
 
<h2>7.Sleep</h2>

<h4>Your babys sleep patterns change as she grows up.
 Newborns sleep through a major part of the 24 hours,
  waking up often during both day and night. Even so,
   you can still begin to develop a bedtime routine for
    your baby from as early as 6 to 8 weeks. Read up about how to 
    take care of baby after birth and plan her sleep routine accordingly!
As your baby grows up she starts to develop a more concrete night-time
 sleep routine with fewer daytime naps. You can help her with this by
  teaching her that night-time is for sleep, and not play.</h4>

<script src="resources/jquery.min.js"></script>
<script src="resources/bootstrap.min.js"></script>

 <style>
 .navbar-inverse{background:linear-gradient(black,gray);border-color:#080808}
 </style>
	
	</html>
	<footer>
		<div class="footer"> Team	      
	    </div>/
	</footer>	
</body>

</html>