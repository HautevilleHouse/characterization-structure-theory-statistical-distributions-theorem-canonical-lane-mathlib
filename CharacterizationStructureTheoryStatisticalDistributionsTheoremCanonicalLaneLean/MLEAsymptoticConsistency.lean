import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure MLEAsymptoticStructure where
  sampleSpace : Type u
  parameterSpace : Type v
  likelihoodFunction : parameterSpace → sampleSpace → ℝ
  maximumLikelihoodEstimator : sampleSpace → parameterSpace
  sampleSize : ℕ → ℕ
  consistency : Prop
  asymptoticNormality : Prop
  efficiency : Prop
  regularityConditions : Prop
  consistencyTerm : consistency
  asymptoticNormalityTerm : asymptoticNormality
  efficiencyTerm : efficiency
  regularityConditionsTerm : regularityConditions

structure MLEAsymptoticEvidence (M : MLEAsymptoticStructure) where
  consistencyClosed : M.consistency
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyClosed : M.efficiency
  regularityConditionsClosed : M.regularityConditions

def MLEAsymptoticClosed (M : MLEAsymptoticStructure) : Prop :=
  M.consistency ∧ M.asymptoticNormality ∧ M.efficiency ∧ M.regularityConditions

theorem mle_asymptotic_closed_from_evidence (M : MLEAsymptoticStructure) (Ev : MLEAsymptoticEvidence M) : MLEAsymptoticClosed M := by
  exact And.intro Ev.consistencyClosed (And.intro Ev.asymptoticNormalityClosed (And.intro Ev.efficiencyClosed Ev.regularityConditionsClosed))

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse