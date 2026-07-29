import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure SufficiencyStructure where
  statistic : Type u
  conditionalDistribution : Type v
  parameterSpace : Type w
  statisticSufficient : Prop
  conditionalWellDefined : Prop
  factorizationTheoremHolds : Prop

structure SufficiencyEvidence (S : SufficiencyStructure) where
  statisticSufficientClosed : S.statisticSufficient
  conditionalWellDefinedClosed : S.conditionalWellDefined
  factorizationTheoremHoldsClosed : S.factorizationTheoremHolds

def SufficiencyClosed (S : SufficiencyStructure) : Prop :=
  S.statisticSufficient ∧ S.conditionalWellDefined ∧ S.factorizationTheoremHolds

theorem sufficiency_closed_from_evidence (S : SufficiencyStructure) (Ev : SufficiencyEvidence S) : SufficiencyClosed S := by
  exact And.intro Ev.statisticSufficientClosed (And.intro Ev.conditionalWellDefinedClosed Ev.factorizationTheoremHoldsClosed)

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse