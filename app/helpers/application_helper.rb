module ApplicationHelper
  def get_about_us_content
   "<p>India Internet Fund is an India-focused venture fund that invests in early stage internet/mobile startups. With offices in Mumbai and New
York, IIF seeks to also facilitate cross-pollination of ideas, technologies and startups between the U.S. and India.</p> 
    <p> The firm takes a hands-on approach and provides talented, driven entrepreneurs with on-the-ground management strategy and execution. The firm is led by Nihal Mehta and Anirudh Suri, who collectively bring vast experience in entrepreneurship, investing and managing with deep industry knowledge and relationships in the mobile space across the public and private sectors.</p>
    <h2>Investment Profile</h2>
    <p><b>Stage</b>We invest in early stage startups, the earlier the better<br />
    <b>Size</b>We can invest as little as $25k to $100k and as much as $300
             to 500k, depending on the stage of the startup and its needs.<br />
    <b>Sectors</b>We're 100% focused on mobile and internet startups.<br />
    </p>"
  end 
  
  def get_our_team_content
    "<b>Nihal Mehta,</b> Founding Partner." + "<p>  With over 12 years experience in innovating marketing technologies through four successful startups to date, Nihal Mehta, is a noted expert in the emerging adoption of wireless technologies for media properties and consumer brands. Named a top 10 NYC 'game changer' in the 2010 New York Enterprise Report, one of twenty RCR Wireless News 'mobile movers and shakers' in 2008, a BusinessWeek 'M-Commerce Baron' in 2006 and named one of AdAge's 'top 20 marketers in their 20s' in 2005, Nihal is currently CEO and co-founder of the social cityguide,"+ "buzzd"+
    ", backed by the Blackberry Partners Fund, Qualcomm Ventures, Greycroft and Monitor Ventures. Prior to buzzd, Nihal founded ipsh!, one of the first full-service mobile marketing agencies in 2001, which he sold to Omnicom (NYSE: OMC) in 2005. Nihal started his entrepreneurial career by founding Urbangroove, an online nightlife portal, in 1999. Nihal's other entrepreneurial projects include co-chairing the innovation advisory board for " + (link_to "Reshma for Congress", "http://www.reshma2010.com", :target => "_blank" ) + ", co-founding the non-profit "+(link_to "Project Ahimsa", "http://www.projectahimsa.org", :target => "_blank" ) + ", and being a co-founding general partner at the mobile seed venture fund ENIAC.</p>" + 
    "<p>  Nihal graduated from the University of Pennsylvania with a BA in Philosophy and a BSE in Computer Science and frequently guest lectures at business schools around the country on entrepreneurship and mobile marketing, and is published in over 15 books and white-papers on the subject.</p> 
     <b>Anirudh Suri,</b> Founding Partner, India Internet Fund.<p>Anirudh previously worked at McKinsey &#38; Company in its New York, New Jersey and Washington DC offices, serving various governments andlarge corporations around the world. Anirudh has served as a policy advisor to the Minister of State for Communications and Technology in the Government of India, where he focused on mobile, broadband and cybersecurity-related issues.He also served as an Associate at PSI, a small venture capital firm in India, focusing on portfolio companies in the education and technology sectors. Prior to that, he was a Junior Fellow and Founding Managing Editor of South Asian Perspectives at the Carnegie Endowment for International Peace, a foreign policy think-tank in Washington, DC.</p> 
 <p>In 2011, he was awarded the India Empire Most Promising Overseas Indian Award in conjunction with the Pravasi Bharatiya Divas. Anirudh was also chosen as a Goldman Sachs Global Leader in 2004 and has spoken at various conferences in India and the United States. He graduated from Haverford College with a BA in Economics and International Relations, after having spent a year studying the same subjects at the London School of Economics. He has also studied business and public administration (a joint MBA-MPA degree) at the Harvard Kennedy School and the Wharton School at the University of Pennsylvania.</p>"
  end
  def get_portfolio_content
    "<p>Our Portfolio currently consists of the following companies:</p>" + (link_to image_tag("ignighter.png"), "http://www.ignighter.com", :target => "_blank" ) + "<br /> <br />" +
     (link_to image_tag("exclusivelyin.png"), "http://www.exclusively.in", :target => "_blank" ) + "<br /> <br />" +
     (link_to image_tag("eksms.png"), "http://www.eksms.com", :target => "_blank" ) + "<br /> <br />" +
     (link_to image_tag("WildEastGroupLogo.png", :width => "314px", :height => "96px"), "http://www.wildeastgroup.com", :target => "_blank" )   
	#<a href ="http://www.ignighter.com" target="_blank"><img src="/images/ignighter.png" alt="Ignighter" /></a><br /><br />
	#<a href ="http://www.exclusively.in" target="_blank"><img src="/images/exclusivelyin.png" alt="ExclusivelyIn" /></a><br /><br />
  #<a href ="http://www.eksms.com" target="_blank"><img src="/images/eksms.png" alt="Eksms" /></a><br /><br />	
#	<a href ="http://www.wildeastgroup.com" target="_blank"><img src="/images/WildEastGroupLogo.png" alt="WildEastGroup" width="314px" height ="96px" /></a>"
  end
end
