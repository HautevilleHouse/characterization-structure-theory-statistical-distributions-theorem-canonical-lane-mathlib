import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure MaximumLikelihoodEstimator where
  likelihoodFunction : Type u
  parameterSpace : Type v
  sampleSpace : Type w
  regularityConditions : Prop
  consistency : Prop
  asymptoticNormality : Prop
  efficiency : Prop

struct MLEEvidence (M : MaximumLikelihoodEstimator) where
  regularityConditionsClosed : M.regularityConditions
  consistencyClosed : M.consistency
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyClosed : M.efficiency

def MLEClosed (M : MaximumLikelihoodEstimator) : Prop :=
  M.regularityConditions ∧ M.consistency ∧ M.asymptoticNormality ∧ M.efficiency

theorem mle_closed_from_evidence (M : MaximumLikelihoodEstimator) (Ev : MLEEvidence M) : MLEClosed M := by
  exact And.intro Ev.regularityConditionsClosed (And.intro Ev.consistencyClosed (And.intro Ev.asymptoticNormalityClosed Ev.efficiencyClosed))

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse