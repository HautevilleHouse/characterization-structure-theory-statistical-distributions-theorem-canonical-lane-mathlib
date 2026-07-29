import CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean.NeymanPearsonLemma

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure CharacterizationDistributionsPackage where
  distributionFamily : Type u
  characterizationProperty : Prop
  uniqueCharacterization : Prop
  closureUnderOperations : Prop

structure CharacterizationDistributionsEvidence (C : CharacterizationDistributionsPackage) where
  characterizationPropertyClosed : C.characterizationProperty
  uniqueCharacterizationClosed : C.uniqueCharacterization
  closureUnderOperationsClosed : C.closureUnderOperations

def CharacterizationDistributionsClosed (C : CharacterizationDistributionsPackage) : Prop :=
  C.characterizationProperty ∧ C.uniqueCharacterization ∧ C.closureUnderOperations

theorem characterization_distributions_closed_from_evidence
    (C : CharacterizationDistributionsPackage) (E : CharacterizationDistributionsEvidence C) :
    CharacterizationDistributionsClosed C := by
  exact And.intro E.characterizationPropertyClosed
    (And.intro E.uniqueCharacterizationClosed E.closureUnderOperationsClosed)

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse