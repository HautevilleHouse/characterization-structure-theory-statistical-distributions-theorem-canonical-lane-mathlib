import CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure SufficiencyExponentialFamilyPackage where
  sufficientStatistic : Type u
  exponentialFamilyForm : Type v
  factorizationCriterion : Prop
  dimensionReduction : Prop
  naturalParameter : Type w

structure SufficiencyExponentialFamilyEvidence (P : SufficiencyExponentialFamilyPackage) where
  factorizationCriterionClosed : P.factorizationCriterion
  dimensionReductionClosed : P.dimensionReduction

def SufficiencyExponentialFamilyClosed (P : SufficiencyExponentialFamilyPackage) : Prop :=
  P.factorizationCriterion ∧ P.dimensionReduction

theorem sufficiency_exponential_family_closed_from_evidence
    (P : SufficiencyExponentialFamilyPackage) (E : SufficiencyExponentialFamilyEvidence P) :
    SufficiencyExponentialFamilyClosed P := by
  exact And.intro E.factorizationCriterionClosed E.dimensionReductionClosed

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse