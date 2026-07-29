import CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : StatisticalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  StatisticalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse