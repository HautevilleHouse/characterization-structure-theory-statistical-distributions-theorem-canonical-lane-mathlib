import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure SufficiencyPackage where
  statistic : Type
  sufficientStatistic : Prop
  factorizationTheorem : Prop
  minimalSufficiency : Prop

structure SufficiencyEvidence (S : SufficiencyPackage) where
  sufficientStatisticClosed : S.sufficientStatistic
  factorizationTheoremClosed : S.factorizationTheorem
  minimalSufficiencyClosed : S.minimalSufficiency

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.sufficientStatistic ∧ S.factorizationTheorem ∧ S.minimalSufficiency

theorem sufficiency_closed_from_evidence (S : SufficiencyPackage) (E : SufficiencyEvidence S) : SufficiencyClosed S := by
  exact And.intro E.sufficientStatisticClosed (And.intro E.factorizationTheoremClosed E.minimalSufficiencyClosed)

structure ExponentialFamilyPackage where
  parameterSpace : Type
  naturalParameter : Type
  sufficientStatistic : Type
  baseMeasure : Type
  logPartition : Type
  exponentialForm : Prop
  canonicalParameterization : Prop

structure ExponentialFamilyEvidence (F : ExponentialFamilyPackage) where
  exponentialFormClosed : F.exponentialForm
  canonicalParameterizationClosed : F.canonicalParameterization

def ExponentialFamilyClosed (F : ExponentialFamilyPackage) : Prop :=
  F.exponentialForm ∧ F.canonicalParameterization

theorem exponential_family_closed_from_evidence (F : ExponentialFamilyPackage) (E : ExponentialFamilyEvidence F) : ExponentialFamilyClosed F := by
  exact And.intro E.exponentialFormClosed E.canonicalParameterizationClosed

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse