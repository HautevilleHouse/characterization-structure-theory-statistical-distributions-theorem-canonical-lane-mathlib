import CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean.SufficiencyExponentialFamily

namespace HautevilleHouse
namespace CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean

structure MLEAsymptoticNormalityPackage where
  maximumLikelihoodEstimator : Type u
  fisherInformation : Type v
  consistencyClosed : Prop
  asymptoticNormalityClosed : Prop
  efficiencyClosed : Prop

structure MLEAsymptoticNormalityEvidence (M : MLEAsymptoticNormalityPackage) where
  consistencyClosedClosed : M.consistencyClosed
  asymptoticNormalityClosedClosed : M.asymptoticNormalityClosed
  efficiencyClosedClosed : M.efficiencyClosed

def MLEAsymptoticNormalityClosed (M : MLEAsymptoticNormalityPackage) : Prop :=
  M.consistencyClosed ∧ M.asymptoticNormalityClosed ∧ M.efficiencyClosed

theorem mle_asymptotic_normality_closed_from_evidence
    (M : MLEAsymptoticNormalityPackage) (E : MLEAsymptoticNormalityEvidence M) :
    MLEAsymptoticNormalityClosed M := by
  exact And.intro E.consistencyClosedClosed
    (And.intro E.asymptoticNormalityClosedClosed E.efficiencyClosedClosed)

end CharacterizationStructureTheoryStatisticalDistributionsTheoremCanonicalLaneLean
end HautevilleHouse