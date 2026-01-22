import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/portfolio_data.dart';
import '../../../data/default_data/basic_info_data.dart';
import '../../../data/default_data/technical_skills_data.dart';
import '../../../data/default_data/projects_data.dart';
import '../../../data/default_data/experiences_data.dart';
import '../../../data/default_data/education_data.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc()
      : super(PortfolioState(
          data: _getBasicInfoOnly(),
          isLoading: false,
          loadedSections: const {'basic'},
        )) {
    on<LoadBasicInfo>(_onLoadBasicInfo);
    on<LoadTechnicalSkills>(_onLoadTechnicalSkills);
    on<LoadProjects>(_onLoadProjects);
    on<LoadExperiences>(_onLoadExperiences);
    on<LoadEducation>(_onLoadEducation);
    on<LoadAllData>(_onLoadAllData);
    on<PortfolioDataUpdated>(_onPortfolioDataUpdated);

    // Load basic info immediately (lightweight)
    add(const LoadBasicInfo());
  }

  Future<void> _onLoadBasicInfo(
    LoadBasicInfo event,
    Emitter<PortfolioState> emit,
  ) async {
    if (state.isSectionLoaded('basic')) return;
    
    emit(state.copyWith(isLoading: true, error: null));
    
    final currentData = state.data ?? _getBasicInfoOnly();
    final updatedData = currentData.copyWith(
      developerName: BasicInfoData.developerName,
      developerTitle: BasicInfoData.developerTitle,
      introMessage: BasicInfoData.introMessage,
      resumeLink: BasicInfoData.resumeLink,
      socialLinks: BasicInfoData.socialLinks,
    );
    
    emit(state.copyWith(
      data: updatedData,
      isLoading: false,
      loadedSections: {...state.loadedSections, 'basic'},
    ));
  }

  Future<void> _onLoadTechnicalSkills(
    LoadTechnicalSkills event,
    Emitter<PortfolioState> emit,
  ) async {
    if (state.isSectionLoaded('skills')) return;
    
    emit(state.copyWith(isLoading: true, error: null));
    
    // Simulate async loading delay for better UX
    await Future.delayed(const Duration(milliseconds: 100));
    
    final currentData = state.data ?? _getBasicInfoOnly();
    final updatedData = currentData.copyWith(
      technicalSkills: TechnicalSkillsData.getSkills(),
    );
    
    emit(state.copyWith(
      data: updatedData,
      isLoading: false,
      loadedSections: {...state.loadedSections, 'skills'},
    ));
  }

  Future<void> _onLoadProjects(
    LoadProjects event,
    Emitter<PortfolioState> emit,
  ) async {
    if (state.isSectionLoaded('projects')) return;
    
    emit(state.copyWith(isLoading: true, error: null));
    
    // Simulate async loading delay for better UX
    await Future.delayed(const Duration(milliseconds: 100));
    
    final currentData = state.data ?? _getBasicInfoOnly();
    final updatedData = currentData.copyWith(
      projects: ProjectsData.getProjects(),
    );
    
    emit(state.copyWith(
      data: updatedData,
      isLoading: false,
      loadedSections: {...state.loadedSections, 'projects'},
    ));
  }

  Future<void> _onLoadExperiences(
    LoadExperiences event,
    Emitter<PortfolioState> emit,
  ) async {
    if (state.isSectionLoaded('experiences')) return;
    
    emit(state.copyWith(isLoading: true, error: null));
    
    // Simulate async loading delay for better UX
    await Future.delayed(const Duration(milliseconds: 100));
    
    final currentData = state.data ?? _getBasicInfoOnly();
    final updatedData = currentData.copyWith(
      experiences: ExperiencesData.getExperiences(),
    );
    
    emit(state.copyWith(
      data: updatedData,
      isLoading: false,
      loadedSections: {...state.loadedSections, 'experiences'},
    ));
  }

  Future<void> _onLoadEducation(
    LoadEducation event,
    Emitter<PortfolioState> emit,
  ) async {
    if (state.isSectionLoaded('education')) return;
    
    emit(state.copyWith(isLoading: true, error: null));
    
    // Simulate async loading delay for better UX
    await Future.delayed(const Duration(milliseconds: 100));
    
    final currentData = state.data ?? _getBasicInfoOnly();
    final updatedData = currentData.copyWith(
      education: EducationData.getEducation(),
    );
    
    emit(state.copyWith(
      data: updatedData,
      isLoading: false,
      loadedSections: {...state.loadedSections, 'education'},
    ));
  }

  Future<void> _onLoadAllData(
    LoadAllData event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    
    final allData = _getDefaultData();
    
    emit(state.copyWith(
      data: allData,
      isLoading: false,
      loadedSections: const {'basic', 'skills', 'projects', 'experiences', 'education'},
    ));
  }

  void _onPortfolioDataUpdated(
    PortfolioDataUpdated event,
    Emitter<PortfolioState> emit,
  ) {
    emit(state.copyWith(data: event.data, isLoading: false, error: null));
  }

  static PortfolioData _getBasicInfoOnly() {
    return PortfolioData(
      developerName: BasicInfoData.developerName,
      developerTitle: BasicInfoData.developerTitle,
      introMessage: BasicInfoData.introMessage,
      resumeLink: BasicInfoData.resumeLink,
      socialLinks: BasicInfoData.socialLinks,
      technicalSkills: const [],
      experiences: const [],
      projects: const [],
      education: const [],
    );
  }

  static PortfolioData _getDefaultData() {
    // Load all data at once (used by LoadAllData event)
    return PortfolioData(
      developerName: BasicInfoData.developerName,
      developerTitle: BasicInfoData.developerTitle,
      introMessage: BasicInfoData.introMessage,
      resumeLink: BasicInfoData.resumeLink,
      socialLinks: BasicInfoData.socialLinks,
      technicalSkills: TechnicalSkillsData.getSkills(),
      experiences: ExperiencesData.getExperiences(),
      projects: ProjectsData.getProjects(),
      education: EducationData.getEducation(),
    );
  }
}
