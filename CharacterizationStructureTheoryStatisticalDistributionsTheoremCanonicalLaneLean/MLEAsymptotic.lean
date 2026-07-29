import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure MaximumLikelihoodEstimate (θ : ℝ^n) (data : Vector ℝ m) where
  likelihoodFunction : ℝ^n → ℝ
  argmax : ℝ^n
  argmaxMaximizes : ∀ θ, likelihoodFunction θ ≤ likelihoodFunction argmax
  argmaxCriticalPoint : gradient likelihoodFunction argmax = 0
  hessianNegativeDefinite : NegDef (hessian likelihoodFunction argmax)

structure MLEAsymptoticNormality (M : StatisticalModel) where
  mle : ℝ^n
  trueParameter : ℝ^n
  fisherInformation : Matrix ℝ^n ℝ^n
  consistency : mle →P trueParameter as n → ∞
  asymptoticNormality : √n (mle - trueParameter) →D N(0, fisherInformation⁻¹)

structure MLEEvidence (M : StatisticalModel) (A : MLEAsymptoticNormality M) where
  consistencyClosed : A.consistency
  asymptoticNormalityClosed : A.asymptoticNormality
  fisherInfoPositiveDefinite : PosDef A.fisherInformation

def MLEAsymptoticClosed (M : StatisticalModel) (A : MLEAsymptoticNormality M) : Prop :=
  MLEEvidence M A

theorem mle_asymptotic_closed_from_evidence (M : StatisticalModel) (A : MLEAsymptoticNormality M) (ev : MLEEvidence M A) :
  MLEAsymptoticClosed M A := ev

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse