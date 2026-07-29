import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure ExponentialFamilyPackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  dominatingMeasure : Type v
  sufficientStatistic : sampleSpace → ℝ^n
  logNormalizer : ℝ^n → ℝ
  baseMeasure : sampleSpace → ℝ
  sufficientStatisticMeasurable : Measurable (sufficientStatistic)
  logNormalizerSmooth : Smooth logNormalizer
  baseMeasureNonnegative : ∀ x, baseMeasure x ≥ 0

def exponentialFamilyDensity (E : ExponentialFamilyPackage) (θ : ℝ^n) (x : E.sampleSpace) : ℝ :=
  Real.exp (E.sufficientStatistic x · θ - E.logNormalizer θ) * E.baseMeasure x

structure ExponentialFamilyEvidence (E : ExponentialFamilyPackage) where
  densityIntegratesToOne : ∀ θ, ∫ x, exponentialFamilyDensity E θ x ∂E.dominatingMeasure = 1
  logNormalizerGradientEqualsExpectation : ∀ θ, grad E.logNormalizer θ = E.sufficientStatistic ∫ as measure
  convexityOfLogNormalizer : Convex E.logNormalizer
  fisherInformationPositiveDefinite : PosDef (Hessian E.logNormalizer)

def ExponentialFamilyClosed (E : ExponentialFamilyPackage) : Prop :=
  ExponentialFamilyEvidence E

theorem exponential_family_closed_from_evidence (E : ExponentialFamilyPackage) (ev : ExponentialFamilyEvidence E) :
  ExponentialFamilyClosed E := ev

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse