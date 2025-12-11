class DentalCase {
  final String title;
  final String description;
  final String imageUrl;
  final String category;

  DentalCase({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
  });
}

final List<DentalCase> staticCases = [
  // DentalCase(
  //   title: "Removable Partial Denture",
  //   description:
  //       "Custom partial denture restoring multiple missing teeth for improved speech and chewing.",
  //   imageUrl: "assets/images/partialDenture.jpg",
  //   category: "Partial Denture",
  // ),
  DentalCase(
    title: "Metal Framework Denture",
    description:
        "Partial denture with metal framework for strength and natural appearance.",
    imageUrl: "assets/images/partialDenture1.jpg",
    category: "Partial Denture",
  ),

  DentalCase(
    title: "Full Set of Dentures",
    description:
        "Fabrication of both upper and lower full dentures for a completely edentulous case.",
    imageUrl: "assets/images/completeDenture2.png",
    category: "Complete Denture",
  ),
  DentalCase(
    title: "Molar Replacement",
    description:
        "Fabrication of a single molar denture for better chewing and healthy jaw alignment.",
    imageUrl: "assets/images/completeDenture2.png",
    category: "Single Denture",
  ),
  // DentalCase(
  //   title: "Lower Complete Denture",
  //   description:
  //       "Natural looking lower complete denture for edentulous patients.",
  //   imageUrl: "assets/images/completeDenture1.jpg",
  //   category: "Complete Denture",
  // ),

  // DentalCase(
  //   title: "Full Set of Dentures",
  //   description:
  //       "Fabrication of both upper and lower full dentures for a completely edentulous case.",
  //   imageUrl: "assets/images/completeDenture.jpg",
  //   category: "Complete Denture",
  // ),
  DentalCase(
    title: "Upper Incisor Denture",
    description:
        "Replacement of a single missing front tooth using a natural-looking single acrylic denture.",
    imageUrl: "assets/images/singleDenture.jpg",
    category: "Single Denture",
  ),

  DentalCase(
    title: "Acrylic Partial Denture",
    description:
        "Lightweight acrylic partial denture designed for easy use and clean maintenance.",
    imageUrl: "assets/images/partialDenture2.jpg",
    category: "Partial Denture",
  ),
  DentalCase(
    title: " Implant Supported Denture",
    description:
        "Utilization of dental implants to support a single denture for improved stability and comfort.",
    imageUrl: "assets/images/singleDenture2.jpg",
    category: "Single Denture",
  ),
  DentalCase(
    title: "Deep Caries Management",
    description:
        "Restoration of molars with large cavities caused by advanced caries, using composite fillings.",
    imageUrl: "assets/images/Cariescase.webp",
    category: "Caries",
  ),
  DentalCase(
    title: "Multiple Caries Treatment",
    description:
        "Patient presenting pain and sensitivity treated with root canal therapy and tooth-colored restorations.",
    imageUrl: "assets/images/Cariescase1.jpg",
    category: "Caries",
  ),
  DentalCase(
    title: "Early Childhood Caries",
    description:
        "Case of rampant caries in a pediatric patient, restored with preventive care and dental fillings.",
    imageUrl: "assets/images/Cariescase2.jpg",
    category: "Caries",
  ),
  DentalCase(
    title: "Total Rehabilitation",
    description:
        "Full restoration for patient suffering from severe tooth wear and bite collapse, using crowns and bridges.",
    imageUrl: "assets/images/Full mouth Rehabilitation cases.jpg",
    category: "Full mouth Rehabilitation cases",
  ),
  DentalCase(
    title: "Occlusion Correction",
    description:
        "Comprehensive dental treatment to correct occlusal trauma and improve chewing and quality of life.",
    imageUrl: "assets/images/Full mouth Rehabilitation cases1.jpg",
    category: "Full mouth Rehabilitation cases",
  ),
  DentalCase(
    title: "Smile Makeover",
    description:
        "Full mouth rehabilitation combining implants, veneers, and natural teeth alignment for a beautiful smile.",
    imageUrl: "assets/images/Full mouth Rehabilitation cases2.jpg",
    category: "Full mouth Rehabilitation cases",
  ),
  DentalCase(
    title: "Facial Trauma Repair",
    description:
        "Maxillofacial surgery to reconstruct damaged facial bones after accident, restoring function and appearance. ",
    imageUrl: "assets/images/Maxillofacial cases1.jpg",
    category: "Maxillofacial cases",
  ),
  DentalCase(
    title: "Jaw Defect Correction",
    description:
        "Surgical treatment for a patient with a congenital jaw defect restored using grafting and prosthesis..",
    imageUrl: "assets/images/Maxillofacial cases.jpg",
    category: "Maxillofacial cases",
  ),
  // أضف حالات كثيرة أخرى بنفس الأسلوب.
];
