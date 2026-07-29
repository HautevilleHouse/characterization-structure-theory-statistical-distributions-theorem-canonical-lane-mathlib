import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure MaximumLikelihoodEstimationPackage where
  parameterSpace : Type
  observationSpace : Type
  likelihoodFunction : Type
  mleEstimator : Type
  consistency : Prop
  asymptoticNormality : Prop
  invarianceProperty : Prop

structure MaximumLikelihoodEvidence (M : MaximumLikelihoodEstimationPackage) where
  consistencyClosed : M.consistency
  asymptoticNormalityClosed : M.asymptoticNormality
  invariancePropertyClosed : M.invarianceProperty

def MaximumLikelihoodClosed (M : MaximumLikelihoodEstimationPackage) : Prop :=
  M.consistency ∧ M.asymptoticNormality ∧ M.invarianceProperty

theorem maximum_likelihood_closed_from_evidence (M : MaximumLikelihoodEstimationPackage) (E : MaximumLikelihoodEvidence M) : MaximumLikelihoodClosed M := by
  exact And.intro E.consistencyClosed (And.intro E.asymptoticNormalityClosed E.invariancePropertyClosed)

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse