import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure HypothesisTest (H0 : StatisticalModel) (H1 : StatisticalModel) where
  criticalRegion : Set H0.sampleSpace
  significanceLevel : ℝ
  power : ℝ
  size : ℝ

def likelihoodRatio (H0 H1 : StatisticalModel) (x : H0.sampleSpace) : ℝ :=
  H1.densities 1 x / H0.densities 0 x

structure MostPowerfulTest (H0 H1 : StatisticalModel) (α : ℝ) where
  test : HypothesisTest H0 H1
  sizeIsAlpha : test.size = α
  isMostPowerful : ∀ (other : HypothesisTest H0 H1), other.size ≤ α → test.power ≥ other.power

structure NeymanPearsonEvidence (H0 H1 : StatisticalModel) (α : ℝ) where
  threshold : ℝ
  criticalRegionDefined : setOf (λ x => likelihoodRatio H0 H1 x > threshold) = 
    (someMostPowerfulTest H0 H1 α).test.criticalRegion
  sizeThresholdEqualsAlpha : (someMostPowerfulTest H0 H1 α).size = α

def NeymanPearsonClosed (H0 H1 : StatisticalModel) (α : ℝ) : Prop :=
  NeymanPearsonEvidence H0 H1 α

theorem neyman_pearson_closed_from_evidence (H0 H1 : StatisticalModel) (α : ℝ) (ev : NeymanPearsonEvidence H0 H1 α) :
  NeymanPearsonClosed H0 H1 α := ev

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse