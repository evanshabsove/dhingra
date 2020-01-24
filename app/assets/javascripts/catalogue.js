$(function(){

  var array = ["LondonArea.pdf", "NewDesigns.pdf", "ParrySound.pdf", "Peggy's Cove.pdf", "Kejimkujik.pdf", "Kouchibouguac.pdf", "Kingston,1,000Islands.pdf", "NorthBay.pdf", "Temagami.pdf", "Stewart.pdf", "KawarthaLakes.pdf", "LakeLouiseBanffCanmoreCalgary.pdf", "Pembroke.pdf", "PrinceGeorge.pdf", "Yellowknife.pdf", "St John's-Gros Morne (1).pdf", "Halifax.pdf", "Saskatoon-PrinceAlbert.pdf", "LakeofBaysDorsetKawagamaLake.pdf", "Charlottetown.pdf", "JasperEdmonton.pdf", "VancouverWhistler.pdf", "CapeBreton Highlands.pdf", "ManitoulinIsland.pdf", "Kitchener-WaterlooArea.pdf", "TorontoArea.pdf", "FrenchRiver.pdf", "Timmins.pdf", "Ottawa.pdf", "BigWhiteSkiResort.pdf", "VancouverIsland.pdf", "Bracebridge.pdf", "GardenBay.pdf", "PrinceEdwardCounty.pdf", "Rouyn-Noranda.pdf", "GlacierNationalPark.pdf", "Winnipeg.VictoriaBeach.pdf", "LacLongville,Gaspe.pdf", "Kaslo.pdf", "PowellRiver.pdf", "YohoNationalPark.pdf", "InvermereKimberleyKamloops.pdf", "CapeBreton.pdf", "Huntsville.pdf", "LakeNippissing.pdf", "Haliburton.pdf", "Bay of Fundy.pdf", "LakeSimcoeArea.pdf", "RideauLakesWestportMerrickvillePerthAlmonte.pdf", "Muskoka.pdf", "FortMcMurray.pdf", "Killarney.pdf", "GrandBend.pdf", "KillbearBonEcho.pdf", "Bayfield.pdf", "AlgonquinProv.Park.pdf", "HoneyHarbour.pdf", "Kenora.pdf", "MontrealMontTrembant.pdf", "St John's-Gros Morne.pdf", "Gatineau.pdf", "Burk'sFallsKearney.pdf", "BrucePeninsula.pdf", "Whitehorse.pdf", "ThunderBay.pdf", "QuebecCity,Laurentides.pdf"]

  var previous;

  $("#province").on('focus', function () {
    previous = this.value.toLowerCase().split(' ').join('_');
  }).change(function() {
    $("#" + previous).toggle()

    previous = this.value.toLowerCase().split(' ').join('_');
    $("#" + previous).toggle()
  });

  $("#download-specific-catalogue").on('click', function(e){
    var province = $("#province").val().toLowerCase().split(' ').join('_');
    var region = $("#" + province).find('select').val()
    var fileName;
    for (var i = 0; i < array.length; i++) {
      if (array[i].toUpperCase().replace(/\s/g, '').indexOf(region.toUpperCase().replace(/\s/g, '')) !== -1) {
        fileName = array[i]
      }
    }
    $(this).attr('href', "https://dhingra.s3.amazonaws.com/catalogues/" + fileName)
  })



})
