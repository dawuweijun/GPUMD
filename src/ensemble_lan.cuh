/*
    Copyright 2017 Zheyong Fan, Ville Vierimaa, Mikko Ervasti, and Ari Harju
    This file is part of GPUMD.
    GPUMD is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    GPUMD is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with GPUMD.  If not, see <http://www.gnu.org/licenses/>.
*/




#ifndef ENSEMBLE_LAN_H
#define ENSEMBLE_LAN_H
#include "ensemble.cuh"
#include <curand_kernel.h>
class Force;




class Ensemble_LAN : public Ensemble
{
public:
    Ensemble_LAN(int, int, real, real);   
    Ensemble_LAN(int, int, int, int, int, int, int, real, real, real); 
    virtual ~Ensemble_LAN(void);
    virtual void compute(Parameters*, CPU_Data*, GPU_Data*, Force*);
protected:
    int N_source, N_sink, offset_source, offset_sink;
    real c1, c2, c2_source, c2_sink;
    curandState *curand_states, *curand_states_source, *curand_states_sink;
    void integrate_nvt_lan(Parameters*, CPU_Data*, GPU_Data*, Force*);
    void integrate_heat_lan(Parameters*, CPU_Data*, GPU_Data*, Force*);
};




#endif




