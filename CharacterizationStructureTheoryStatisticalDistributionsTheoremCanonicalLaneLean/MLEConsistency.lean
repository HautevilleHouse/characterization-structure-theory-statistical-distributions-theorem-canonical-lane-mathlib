import CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean.LikelihoodFunction

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure MLEConsistencyPackage where
  parameterSpace : Type u
  logLikelihood : Type v
  scoreFunction : Type w
  informationMatrix : Type x
  consistencyResult : Prop
  asymptoticNormality : Prop
  efficiencyResult : Prop
  regularityConditions : Prop
  identifiability : Prop

structure MLEConsistencyEvidence (M : MLEConsistencyPackage) where
  consistencyResultClosed : M.consistencyResult
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyResultClosed : M.efficiencyResult
  regularityConditionsClosed : M.regularityConditions
  identifiabilityClosed : M.identifiability

def MLEConsistencyClosed (M : MLEConsistencyPackage) : Prop :=
  M.consistencyResult ∧ M.asymptoticNormality ∧ M.efficiencyResult ∧ M.regularityConditions ∧ M.identifiability

theorem mle_consistency_closed_from_evidence (M : MLEConsistencyPackage) (Ev : MLEConsistencyEvidence M) : MLEConsistencyClosed M := by
  exact And.intro Ev.consistencyResultClosed (And.intro Ev.asymptoticNormalityClosed (And.intro Ev.efficiencyResultClosed (And.intro Ev.regularityConditionsClosed Ev.identifiabilityClosed)))

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse