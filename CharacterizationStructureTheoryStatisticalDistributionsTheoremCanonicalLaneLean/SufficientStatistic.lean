import CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean.SampleSpace

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure SufficientStatisticPackage where
  sampleSpace : Type u
  parameterSpace : Type v
  statistic : sampleSpace → Type w
  factorizationCriterion : Prop
  minimalSufficiency : Prop
  completeness : Prop
  ancillarity : Prop

structure SufficientStatisticEvidence (S : SufficientStatisticPackage) where
  factorizationCriterionClosed : S.factorizationCriterion
  minimalSufficiencyClosed : S.minimalSufficiency
  completenessClosed : S.completeness
  ancillarityClosed : S.ancillarity

def SufficientStatisticClosed (S : SufficientStatisticPackage) : Prop :=
  S.factorizationCriterion ∧ S.minimalSufficiency ∧ S.completeness ∧ S.ancillarity

theorem sufficient_statistic_closed_from_evidence (S : SufficientStatisticPackage) (Ev : SufficientStatisticEvidence S) : SufficientStatisticClosed S := by
  exact And.intro Ev.factorizationCriterionClosed (And.intro Ev.minimalSufficiencyClosed (And.intro Ev.completenessClosed Ev.ancillarityClosed))

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse